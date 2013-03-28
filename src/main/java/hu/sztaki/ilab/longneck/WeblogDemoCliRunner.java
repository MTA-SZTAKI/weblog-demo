package hu.sztaki.ilab.longneck;

import hu.sztaki.ilab.longneck.cli.CliRunner;

/**
 *
 * @author Molnár Péter <molnarp@sztaki.mta.hu>
 * @author Németh Tibor <tnemeth@sztaki.mta.hu>
 */
public class WeblogDemoCliRunner {
    
    public static void main(String[] args) {
        // Static initialization
        // none
        
        CliRunner cliRunner = new CliRunner();
        cliRunner.execute(args);
    }
    
}
