Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7182F47
	for <llvm@lists.linux.dev>; Sat, 28 Jan 2023 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674924044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TPKrN+0aTLnW+N1VpLJJXxkMGDTe9xvUwraDvkEVp8w=;
	b=XtYO6WcYK3/I0pwywlgQogAvGAn0eCtFGiBP51cmHlbXpMAtXjb1nlfOslO3R3qUhwfHc4
	WMAsYlUuEVB97UekrQjm9MImWKk8f6Rb/NJyfaVWuQiMOh8saIBTxeiPBXdHDInniuNAPv
	wRqrCz1NFQ1rbxi2ZN81X0Kx1i5Fucs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-wojcnipeNt6A3hGLQSXGTA-1; Sat, 28 Jan 2023 11:40:43 -0500
X-MC-Unique: wojcnipeNt6A3hGLQSXGTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE6F1C05143
	for <llvm@lists.linux.dev>; Sat, 28 Jan 2023 16:40:42 +0000 (UTC)
Received: from [172.64.14.22] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6A7B14171BE;
	Sat, 28 Jan 2023 16:40:42 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (28/383 SKIPPED): Test report for master
 (6.2.0-rc5, mainline.kernel.org-clang, 83abd4d4)
Date: Sat, 28 Jan 2023 16:40:42 -0000
To: efuller@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <44955.123012811404300351@us-mta-185.us.mimecast.lan>
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
    Commit message: Merge tag 'platform-drivers-x86-v6.2-3' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/67391

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 - Usex - version 1.9-29
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6849321
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6848887
          x86_64 (debug) - Usex - version 1.9-29
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6849239

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] _panic: _pfx_dmub_abm_set_pipe.isra.0+0x10/0x10 [=
amdgpu]
            URL: https://lore.kernel.org/all/aea57c5f-2d20-c589-ad44-a63f11=
33a3db@linux.intel.com/
            Affected tests:
                  x86_64 (debug) - Boot test
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
        Issue: Regression in iSCSI login negotiation | rx_data returned -13=
, expecting 48
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2162738
            Affected tests:
                 aarch64 - Storage - targetcli basic
                 ppc64le - Storage - targetcli basic
                   s390x - Storage - targetcli basic
                  x86_64 - Storage - targetcli basic
                  x86_64 (debug) - Storage - targetcli basic
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
        Issue: xfstests - nfsv4.2: SELinux prevents rpc.nfsd
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1498
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: [upstream] blktests: discontiguous-io.cpp:92:24: error: =E2=
=80=98uintptr_t=E2=80=99 was not declared in this scope
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1538
            Affected tests:
                 aarch64 - Storage - blktests - nvmeof-mp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - nvmeof-mp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - nvmeof-mp
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
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

