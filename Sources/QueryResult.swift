/**
 Copyright IBM Corporation 2016
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

// MARK: QueryResult

/// The result of an execution of a query.
public enum QueryResult {
    /// An error occurred while executing the query.
    case error(Error)
    /// The result of the query execution as an a `ResultSet`.
    case resultSet(ResultSet)
    /// Indicates the query executed successfully and returned data.
    case success(Any)
    /// Indicates the query executed successfully and returned no data.
    case successNoData
    
    /// Indicates the query executed successfully.
    public var success: Bool {
        switch self {
        case .error:
            return false
        default:
            return true
        }
    }
        
    /// Data received from the query execution represented as a `ResultSet`.
    public var asResultSet: ResultSet? {
        switch self {
        case .resultSet(let resultSet):
            return resultSet
        default:
            return nil
        }
        
    }
    
    /// The error that occurred during query execution.
    public var asError: Error? {
        switch self {
        case .error(let error):
            return error
        default:
            return nil
        }
    }
    
    /// The result of the query execution as a single value.
    public var asValue: Any? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }    
}
