Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE2182B1
	for <llvm@lists.linux.dev>; Tue, 11 Jul 2023 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689070874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tPVr1jcDqq+1P4FixVbVY7W81PaygJinmqOEbU7gAWw=;
	b=Fz1k2c+anu96gIUDwgMxeqSk7xUXnhM6gnwY5HK9rK+de4Bqq91ZvPd2PXdcH6mrGPW04z
	foBjNMT6+3Mm8QkXdtfWXFvxpn6kzNgpJPkFX5Dr2oK1NBW+GaP7/Gu11VCS40MvV2MsSB
	P92h5Kvnl7mmh3d7X5S9kM85unYIELE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-9ct-VaNeMuOWdehjGGYeCw-1; Tue, 11 Jul 2023 06:21:13 -0400
X-MC-Unique: 9ct-VaNeMuOWdehjGGYeCw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B9CA80269A
	for <llvm@lists.linux.dev>; Tue, 11 Jul 2023 10:21:13 +0000 (UTC)
Received: from [172.64.15.54] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8864492C13;
	Tue, 11 Jul 2023 10:21:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 52 of 346): Test report for master
 (6.5.0-rc1, mainline.kernel.org-clang, 06c2afb8)
Date: Tue, 11 Jul 2023 10:21:12 -0000
To: jiji@redhat.com, zlang@redhat.com, omosnace@redhat.com, yiche@redhat.com,
 llvm@lists.linux.dev, haliu@redhat.com, yizhan@redhat.com, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <69403.123071106211300209@us-mta-515.us.mimecast.lan>
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
    Commit message: Linux 6.5-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/95239

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715768
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
         aarch64 - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715803
                   Non-passing subtests:
                       =E2=9D=8C FAIL iptables-Plain-NAT-test
                       =E2=9D=8C FAIL ip6tables-Plain-NAT-test
         aarch64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715813
                   Non-passing subtests:
                       =E2=9D=8C FAIL Test
         ppc64le - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8716014
                   Non-passing subtests:
                       =E2=9D=8C FAIL iptables-Plain-NAT-test
                       =E2=9D=8C FAIL ip6tables-Plain-NAT-test
         ppc64le - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8716028
                   Non-passing subtests:
                       =E2=9D=8C FAIL Test
           s390x - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715851
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
           s390x - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715879
                   Non-passing subtests:
                       =E2=9D=8C FAIL iptables-Plain-NAT-test
                       =E2=9D=8C FAIL ip6tables-Plain-NAT-test
           s390x - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715889
          x86_64 - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715952
                   Non-passing subtests:
                       =E2=9D=8C FAIL iptables-Plain-NAT-test
                       =E2=9D=8C FAIL ip6tables-Plain-NAT-test
          x86_64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715962
          x86_64 (debug) - POSIX pjd-fstest suites
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715717
          x86_64 (debug) - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8715753

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] unchecked MSR access error: RDMSR from 0xe2 at rI=
P: 0xffffffff87090227 (native_read_msr+0x7/0x40) (intel_idle_init_cstates_i=
cpu)
            URL: https://lore.kernel.org/all/CA+QYu4qSBdhEgFURu+ouAf2d_JNPb=
ZgCSUaxCLoGzMqDQOLWsQ@mail.gmail.com/
            Affected tests:
                  x86_64 - Boot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
        Issue: Storage blktests - blk: /sys/block/n1/uuid: No such file or =
directory
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2065886
            Affected tests:
                 aarch64 - Storage - blktests - blk
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
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
        Issue: [upstream] memcpy: detected field-spanning write (size 24) o=
f single field "(char *)name_loc->nameval" at fs/xfs/libxfs/xfs_attr_leaf.c=
:1559 (size 1)
            URL: https://bugzilla.kernel.org/show_bug.cgi?id=3D217522
            Affected tests:
                 aarch64 - xfstests - xfs
                  x86_64 - xfstests - xfs
        Issue: Storage - blktests - nvme-tcp: nvme/013 (run mkfs and data v=
erification fio job on NVMeOF file-backed ns) get stuck
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1398
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1188
            Affected tests:
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Storage - blktests - nvme-tcp: hit test timeout
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7523235
            Affected tests:
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
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
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite



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

