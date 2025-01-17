package com.student.core;

import org.junit.jupiter.api.extension.ParameterContext;
import org.junit.jupiter.params.aggregator.ArgumentsAccessor;
import org.junit.jupiter.params.aggregator.ArgumentsAggregationException;
import org.junit.jupiter.params.aggregator.ArgumentsAggregator;

public class StudentAggregator implements ArgumentsAggregator {

	@Override
	public Object aggregateArguments(ArgumentsAccessor accessor, ParameterContext context)
			throws ArgumentsAggregationException {
		// TODO Auto-generated method stub
		return new Student(
				accessor.getLong(0),
				accessor.getString(1),
				accessor.getString(2),
				accessor.getString(3),
				accessor.getLong(4),
				accessor.getLong(5),
				accessor.getLong(6)
		);
	}

}
