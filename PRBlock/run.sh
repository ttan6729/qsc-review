nohup bash -c '/usr/bin/time -v ./CompressQual SRR032209.sam -q 1' </dev/null 1> SRR032209.out 2> SRR032209.err
nohup bash -c '/usr/bin/time -v ./DecompressQual SRR032209.sam.cqual' </dev/null 1> SRR032209.dec.out 2> SRR032209.dec.err
nohup bash -c '/usr/bin/time -v ./CompressQual SRR13575706_1.sam -q 1' </dev/null 1> SRR13575706_1.out 2> SRR13575706_1.err
nohup bash -c '/usr/bin/time -v ./DecompressQual SRR13575706_1.sam.cqual' </dev/null 1> SRR13575706_1.dec.out 2> SRR13575706_1.dec.err
nohup bash -c '/usr/bin/time -v ./CompressQual SRR7216025_1.sam -q 1' </dev/null 1> SRR7216025_1.out 2> SRR7216025_1.err
nohup bash -c '/usr/bin/time -v ./DecompressQual SRR7216025_1.sam.cqual' </dev/null 1> SRR7216025_1.dec.out 2> SRR7216025_1.dec.err
nohup bash -c '/usr/bin/time -v ./CompressQual SRR5220205_1.sam -q 1' </dev/null 1> SRR5220205_1.out 2> SRR5220205_1.err
nohup bash -c '/usr/bin/time -v ./DecompressQual SRR5220205_1.sam.cqual' </dev/null 1> SRR5220205_1.dec.out 2> SRR5220205_1.dec.err
mkdir PBlock
mv *.out PBlock
mv *.err PBlock
nohup bash -c '/usr/bin/time -v ./CompressQual SRR032209.sam -q 2' </dev/null 1> SRR032209.out 2> SRR032209.err
nohup bash -c '/usr/bin/time -v ./DecompressQual SRR032209.sam.cqual' </dev/null 1> SRR032209.dec.out 2> SRR032209.dec.err
nohup bash -c '/usr/bin/time -v ./CompressQual SRR13575706_1.sam -q 2' </dev/null 1> SRR13575706_1.out 2> SRR13575706_1.err
nohup bash -c '/usr/bin/time -v ./DecompressQual SRR13575706_1.sam.cqual' </dev/null 1> SRR13575706_1.dec.out 2> SRR13575706_1.dec.err
nohup bash -c '/usr/bin/time -v ./CompressQual SRR7216025_1.sam -q 2' </dev/null 1> SRR7216025_1.out 2> SRR7216025_1.err
nohup bash -c '/usr/bin/time -v ./DecompressQual SRR7216025_1.sam.cqual' </dev/null 1> SRR7216025_1.dec.out 2> SRR7216025_1.dec.err
nohup bash -c '/usr/bin/time -v ./CompressQual SRR5220205_1.sam -q 2' </dev/null 1> SRR5220205_1.out 2> SRR5220205_1.err
nohup bash -c '/usr/bin/time -v ./DecompressQual SRR5220205_1.sam.cqual' </dev/null 1> SRR5220205_1.dec.out 2> SRR5220205_1.dec.err
mkdir RBlock
mv *.out RBlock
mv *.err RBlock
