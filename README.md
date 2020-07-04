# docker-drupal-check

## Usage

### Basic
```bash
$ docker run --rm -v $(pwd):/data fazni/drupal-check:latest drupal-check -ad .

2680/6243 [▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░]  42%

------ -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  Line   workspaces/tests/src/Kernel/WorkspaceTestTrait.php (in context of class Drupal\Tests\workspaces\Kernel\EntityReferenceSupportedNewEntitiesConstraintValidatorTest)  
------ -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  33     Property Drupal\KernelTests\KernelTestBase::$container                                                                                                              
         (Drupal\Core\DependencyInjection\ContainerBuilder) does not accept                                                                                                  
         Symfony\Component\DependencyInjection\ContainerInterface.                                                                                                           
  34     Access to an undefined property                                                                                                                                     
         Drupal\Tests\workspaces\Kernel\EntityReferenceSupportedNewEntitiesCon                                                                                               
         straintValidatorTest::$entityTypeManager.                                                                                                                           
  63     Access to an undefined property                                                                                                                                     
         Drupal\Tests\workspaces\Kernel\EntityReferenceSupportedNewEntitiesCon                                                                                               
         straintValidatorTest::$entityTypeManager.                                                                                                                           
------ -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

------ ---------------------------------------------------------------------------------------------------------------------------------- 
  Line   workspaces/tests/src/Kernel/WorkspaceTestTrait.php (in context of class Drupal\Tests\workspaces\Kernel\WorkspaceIntegrationTest)  
------ ---------------------------------------------------------------------------------------------------------------------------------- 
  33     Property Drupal\KernelTests\KernelTestBase::$container                                                                            
         (Drupal\Core\DependencyInjection\ContainerBuilder) does not accept                                                                
         Symfony\Component\DependencyInjection\ContainerInterface.                                                                         
------ ---------------------------------------------------------------------------------------------------------------------------------- 
 
[ERROR] Found 17663 errors
```

### Custom modules
```bash
# Via command line
$  docker run --rm -v $(pwd):/data fazni/drupal-check:latest drupal-check -ad web/modules/custom
```
```yaml
# docker-compose.yml
drupal_check:
  image: fazni/drupal-check:latest
  volumes:
    - .:/data
```
