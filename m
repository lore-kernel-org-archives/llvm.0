Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4978E8F42
	for <llvm@lists.linux.dev>; Sat, 17 Dec 2022 23:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671318696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OZlgAJ4jwj6lZ6ah8fJB8/sdpar3LD2QHLvYNqyI/wc=;
	b=fKhKzs0H98jn0rbkpHPBLwOMmxgGac8v105ER3ZNRABbu9Ub8grdbrjRtaTB9/JGgECzHm
	bGEeqOiGBn2wh8+6pTHZ4bL6Jt7y3WMiSN6qzw9asVqhCnSlSramdsjovpSwqrKwxvKKee
	QJfxv0rqEGIivtx1EYkkrL1ueq1vbm0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-k_Br_e3sODSWA-ExwDRQrg-1; Sat, 17 Dec 2022 18:11:35 -0500
X-MC-Unique: k_Br_e3sODSWA-ExwDRQrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 130F03C10692
	for <llvm@lists.linux.dev>; Sat, 17 Dec 2022 23:11:35 +0000 (UTC)
Received: from [172.64.12.49] (unknown [10.30.33.198])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1C102166B26;
	Sat, 17 Dec 2022 23:11:34 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.1.0,
 mainline.kernel.org-clang, 041fae9c)
Date: Sat, 17 Dec 2022 23:11:34 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Message-Id: <88966.122121718113500177@us-mta-137.us.mimecast.lan>
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
    Commit message: Merge tag 'f2fs-for-6.2-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/jaegeuk/f2fs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/63345

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6400909
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6401562
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6401602

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { create } for  pid=3D60245 comm=3D"=
systemd-coredum" scontext=3Dsystem_u:system_r:systemd_coredump_t:s0 tcontex=
t=3Dsystem_u:system_r:systemd_coredump_t:s0 tclass=3Duser_namespace permiss=
ive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2152137
            Affected tests:
                 aarch64 - LTP: openposix test suite
                 aarch64 - Firmware test suite
                 ppc64le - LTP: openposix test suite
                  x86_64 - LTP: openposix test suite
                  x86_64 (debug) - LTP: openposix test suite
                  x86_64 (debug) - kselftests upstream - net
        Issue: (upstream) Cannot download, all mirrors were already tried w=
ithout success
            URL: https://datawarehouse.cki-project.org/kcidb/tests/5439024
            Affected tests:
                  x86_64 (debug) - LTP: openposix test suite
                  x86_64 (debug) - CIFS Connectathon
                  x86_64 (debug) - xfstests - ext4
        Issue: CIFS Connectathon: ./test4: (/mnt/connectathon/kvm-06-guest1=
1.test) file.0 has mode 555 after chmod 0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1456
            Affected tests:
                 aarch64 - CIFS Connectathon
                 ppc64le - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: kselftests upstream - net: ./runtest.sh: line 182: ./nat6to4=
.o: Permission denied
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1499
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftests upstream: WARN: kselftests/tc-testing test not fo=
und in kselftest-list.txt
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1473
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: [rawhide] avc:  denied  { setpcap } for  pid=3D651 comm=3D"r=
syslogd" capability=3D8  scontext=3Dsystem_u:system_r:syslogd_t:s0 tcontext=
=3Dsystem_u:system_r:syslogd_t:s0 tclass=3Dcapability permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2149633
            Affected tests:
                 aarch64 - Reboot test
                 ppc64le - Reboot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Reboot test
        Issue: xfstests - nfsv4.2: SELinux prevents rpc.nfsd
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1498
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Networking cki netfilter test: FAIL: Command 'ip netns exec =
client timeout 5 sctp_test -H 2001:db8:ffff:21::1 -P 6013 -h 2001:db8:ffff:=
22::2 -p 9999 -s -c 1 -x 1 -X 1' (Expected 0, got 124)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1501
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 ppc64le - Networking cki netfilter test
                  x86_64 - Networking cki netfilter test
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: xfstests - _check_xfs_filesystem: filesystem on /dev/nvme0n1=
p4 is inconsistent (r)
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1989409
            Affected tests:
                 aarch64 - xfstests - btrfs



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

