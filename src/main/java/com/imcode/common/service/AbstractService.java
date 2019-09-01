package com.imcode.common.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public class AbstractService<T> {
    /**
     * 泛型依赖注入
     */
    @Autowired(required = false)
    private Mapper<T> mapper;

    /**
     * 查询所有
     *
     * @return
     */
    public List<T> findAll() {
        return mapper.selectAll();
    }

    /**
     * 按条件查询集合
     *
     * @param param
     * @return
     */
    public List<T> findList(T param) {
        return mapper.select(param);
    }


    /**
     * 按条件查询条数
     *
     * @param param
     * @return
     */
    public Integer findTotal(T param) {
        return mapper.selectCount(param);
    }

    /**
     * 按条件分页查询
     *
     * @param param    查询条件
     * @param pageNum  当前页码
     * @param pageSize 一页显示多少条
     * @return
     */
    public List<T> findList(T param, Integer pageNum, Integer pageSize) {
        pageNum = (pageNum == null ? 0 : pageNum);
        pageSize = (pageSize == null ? 0 : pageSize);
        return mapper.selectByRowBounds(param, new RowBounds(pageNum, pageSize));
    }


    /**
     * 按条件分页查询
     *
     * @param param    查询条件
     * @param pageNum  当前页码
     * @param pageSize 一页显示多少条
     * @return 返回pageinfo对象
     */
    public PageInfo<T> findPageInfo(T param, Integer pageNum, Integer pageSize) {
        pageNum = (pageNum == null ? 0 : pageNum);
        pageSize = (pageSize == null ? 0 : pageSize);

        PageHelper.startPage(pageNum, pageSize);
        List<T> list = this.findList(param);
        return new PageInfo<T>(list);
    }


    /**
     * 按条件查询单条数据
     *
     * @param param
     * @return
     */
    public T findOne(T param) {
        return (T) mapper.selectOne(param);
    }

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    public T getById(Object id) {
        return (T) mapper.selectByPrimaryKey(id);
    }

    /**
     * 新增数据
     *
     * @param record
     */
    public void add(T record) {
        mapper.insertSelective(record);
    }

    /**
     * 更新数据
     *
     * @param record
     */
    public void update(T record) {
        mapper.updateByPrimaryKeySelective(record);
    }


    /**
     * 根据ID删除
     *
     * @param id
     */
    public void deleteById(Object id) {
        mapper.deleteByPrimaryKey(id);
    }


    /**
     * 根据ID删除
     *
     * @param ids
     */
    public void deleteByIds(Object[] ids) {
        for (Object id : ids) {
            mapper.deleteByPrimaryKey(id);
        }
    }

    /**
     * 根据条件删除
     *
     * @param param
     */
    public void delete(T param) {
        mapper.delete(param);
    }
}