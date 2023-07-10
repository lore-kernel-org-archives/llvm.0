Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834AC13ACD
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689006717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zYwVzFZHT69nnZ37QfSJZzcMcDmjL4HtgGvkUwHDUgM=;
	b=bWCj0solOFhqc9e30DoxbisFSGPYTgsnjqUwxrNERZ4BaE0T/W3t1++i+icOOnv5gOO2U/
	Zfbc9RnFEA0GxxI45cJDD7190uzHOkf40s7qeSiyqTyUhOOVxZOUXRZ5dZXbLymfotzycr
	n/hYdShS5F6TzpyYhFRa6hDFGZn72LM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-FUPFYceyPvy9T0zyZsqMMg-1; Mon, 10 Jul 2023 12:31:54 -0400
X-MC-Unique: FUPFYceyPvy9T0zyZsqMMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5A41185A7AA
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 16:31:53 +0000 (UTC)
Received: from [172.64.15.54] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85CCBC478DE;
	Mon, 10 Jul 2023 16:31:53 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 61 of 346): Test report for master
 (6.4.0, mainline.kernel.org-clang, a4524835)
Date: Mon, 10 Jul 2023 16:31:53 -0000
To: jiji@redhat.com, zlang@redhat.com, omosnace@redhat.com, yiche@redhat.com,
 llvm@lists.linux.dev, haliu@redhat.com, yizhan@redhat.com, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <13026.123071012315400319@us-mta-61.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 's390-6.5-2' of git://git.kernel.org/pub/scm/=
linux/kernel/git/s390/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/95097

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8692201
                   Subtests skipped: 7 out of 36
                   Non-passing subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/030
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
         aarch64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8692246
                   Non-passing subtests:
                       =E2=9D=8C FAIL Test
         ppc64le - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8692064
                   Non-passing subtests:
                       =E2=9D=8C FAIL iptables-Plain-NAT-test
                       =E2=9D=8C FAIL ip6tables-Plain-NAT-test
         ppc64le - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8692082
           s390x - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8691923
                   Subtests skipped: 7 out of 36
                   Non-passing subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/030
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
           s390x - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8691961
          x86_64 - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8691979
                   Subtests skipped: 7 out of 36
                   Non-passing subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/030
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
          x86_64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8692043
                   Non-passing subtests:
                       =E2=9D=8C FAIL Test
          x86_64 (debug) - POSIX pjd-fstest suites
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8692398
          x86_64 (debug) - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8692434

    We also see the following known issues which are not related to your ch=
anges:
        Issue: Storage blktests - blk: /sys/block/n1/uuid: No such file or =
directory
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2065886
            Affected tests:
                 aarch64 - Storage - blktests - blk
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: [upstream] unchecked MSR access error: RDMSR from 0xe2 at rI=
P: 0xffffffff87090227 (native_read_msr+0x7/0x40) (intel_idle_init_cstates_i=
cpu)
            URL: https://datawarehouse.cki-project.org/kcidb/tests/8590844
            Affected tests:
                  x86_64 - Boot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
        Issue: Storage - lvm thinp sanity: FAIL: mkfs.xfs -fd noalign /dev/=
mapper/myvg-thinvolume1
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1353
            Affected tests:
                 ppc64le - Storage - lvm thinp sanity
        Issue: kdump - sysrq-c: ERROR: No vmcore-dmesg.txt saved in /var/cr=
ash
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2137631
            Affected tests:
                 ppc64le - kdump - sysrq-c
                 ppc64le - kdump - file-load
        Issue: [upstream] memcpy: detected field-spanning write (size 24) o=
f single field "(char *)name_loc->nameval" at fs/xfs/libxfs/xfs_attr_leaf.c=
:1559 (size 1)
            URL: https://bugzilla.kernel.org/show_bug.cgi?id=3D217522
            Affected tests:
                 aarch64 - xfstests - xfs
                  x86_64 - xfstests - xfs
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: Storage - blktests - nvme-tcp: nvme/013 (run mkfs and data v=
erification fio job on NVMeOF file-backed ns) get stuck
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1398
            Affected tests:
                 aarch64 - Storage - blktests - blk
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Firmware test suite



If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

