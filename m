Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0862561
	for <llvm@lists.linux.dev>; Sat, 21 Jan 2023 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674307232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uIy/la782jNs2dT4/1UNNW8vqGTFqA+d87w4aFyOzsI=;
	b=ScgbRHU6f7Q+sD2ElNqxBSVW1WaRfrxT0uZjG0n2pJjIqDVYNhqf99tWJi+j0N1qWYMFf1
	4Zfrh5CWBt5tjHJjyZIIb8iaw/CGMPSKC0pFwr0ZNFXUdTzik5hf+X8Nj4b3EuaoiPYBqG
	XBJewmKJNwca0UMEbdiRY6ufc4gmyNc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-KMlcbCT9PbGESzkefyyeuA-1; Sat, 21 Jan 2023 08:20:31 -0500
X-MC-Unique: KMlcbCT9PbGESzkefyyeuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F17468533DA
	for <llvm@lists.linux.dev>; Sat, 21 Jan 2023 13:20:30 +0000 (UTC)
Received: from [172.64.0.101] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D35B0140EBF4;
	Sat, 21 Jan 2023 13:20:30 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (27/383 SKIPPED): Test report for master
 (6.2.0-rc4, mainline.kernel.org-clang, 26e57507)
Date: Sat, 21 Jan 2023 13:20:30 -0000
To: mhoyer@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <78611.123012108203100386@us-mta-645.us.mimecast.lan>
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
    Commit message: Merge tag 'for-6.2-rc4-tag' of git://git.kernel.org/pub=
/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/66544

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Storage - targetcli basic
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6767637
         ppc64le - Storage - targetcli basic
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6767773
           s390x - Storage - targetcli basic
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6767717
          x86_64 - Storage - targetcli basic
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6767858
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6767506
          x86_64 (debug) - Storage - targetcli basic
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6767554

    We also see the following known issues which are not related to your ch=
anges:
        Issue: CIFS Connectathon: SELinux prevents mount.cifs, request-key =
and cifs.idmap
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1525
            Affected tests:
                 aarch64 - CIFS Connectathon
                 ppc64le - CIFS Connectathon
                   s390x - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: Networking socket: fuzz: hit test timeout
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1449
            Affected tests:
                  x86_64 (debug) - Networking socket: fuzz
        Issue: kselftests upstream - net: ./runtest.sh: line 182: ./nat6to4=
.o: Permission denied
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1499
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: xfstests - nfsv4.2: SELinux prevents rpc.nfsd
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1498
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: Networking cki netfilter test: FAIL: Command 'ip netns exec =
client timeout 5 sctp_test -H 2001:db8:ffff:21::1 -P 6013 -h 2001:db8:ffff:=
22::2 -p 9999 -s -c 1 -x 1 -X 1' (Expected 0, got 124)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1501
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 ppc64le - Networking cki netfilter test
                   s390x - Networking cki netfilter test
                  x86_64 - Networking cki netfilter test
        Issue: [rawhide][s390x] avc:  denied  { transition } for  pid=3D135=
5 comm=3D"runcon" path=3D"/usr/bin/true" dev=3D"dm-0" ino=3D17226318 sconte=
xt=3Dsystem_u:system_r:unconfined_service_t:s0 tcontext=3Dunconfined_u:unco=
nfined_r:unconfined_t:s0-s0:c0.c1023 tclass=3Dprocess permissive=3D1
            URL: https://datawarehouse.cki-project.org/kcidb/tests/5628421
            Affected tests:
                   s390x - Reboot test
        Issue: [upstream] WARNING: CPU: 120 PID: 1 at arch/powerpc/include/=
asm/book3s/64/tlbflush.h:166 change_protection+0x10d8/0x1470
            URL: https://lore.kernel.org/all/20221019122106.a525f33bafeb74d=
e59fd0d99@danny.cz/
            Affected tests:
                 ppc64le - Reboot test
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
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

