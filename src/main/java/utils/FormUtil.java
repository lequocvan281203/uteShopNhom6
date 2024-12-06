package utils;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;



public class FormUtil 
{
	@SuppressWarnings({ "deprecation", "unchecked" }) //tu set paramiter
	public static <T> T toModel(Class<T> Clazz,HttpServletRequest request) {
		T object = null;
		try {
			object = Clazz.newInstance();
			BeanUtils.populate(object, request.getParameterMap());
			
		} 
		catch (InstantiationException | IllegalAccessException | InvocationTargetException e) 
		{
			System.out.println(e.getMessage());
		} 
		return object;
	}
}