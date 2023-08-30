Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EC15A0
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 05:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693374688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oseiTPs2eRkS74LoMhfmqV8Kz77L6NaB1V+xT2pyfvc=;
	b=iecOaK49jJ090kVmUz7LBUyQxbxGabKc2VjDTDzyW+DQbppeYI1sNThxqucMXcet4DuynD
	IgdF0gAoe4ZCvmo6DeHkTg6Gc56pWdeTmPyXzpX7sDJeurlDrnSkP3cLgiSJvN+P51JFrO
	s1PEmSjz/9nK0U1k87bkw4OREANMBs8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-L_cXD-CMOsCNkzWLcSxlAw-1; Wed, 30 Aug 2023 01:51:26 -0400
X-MC-Unique: L_cXD-CMOsCNkzWLcSxlAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73E3485CCE0
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 05:51:26 +0000 (UTC)
Received: from [172.64.14.60] (unknown [10.30.33.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 538E540C6F4C;
	Wed, 30 Aug 2023 05:51:26 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 14 of 271): Test report for master
 (6.5.0, mainline.kernel.org-clang, b96a3e91)
Date: Wed, 30 Aug 2023 05:51:26 -0000
To: haliu@redhat.com, yinxu@redhat.com, llvm@lists.linux.dev, zlang@redhat.com,
 jiji@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <02670.123083001512600209@us-mta-393.us.mimecast.lan>
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
    Commit message: Merge tag 'mm-stable-2023-08-28-18-26' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/102097

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9325896
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup
         ppc64le - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9326108
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup
           s390x - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9326071
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup
          x86_64 - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9326006
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup
          x86_64 (debug) - POSIX pjd-fstest suites
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9325947
                   Non-passing subtests:
                       =E2=9D=8C FAIL /01_dmesg_check
          x86_64 (debug) - Networking sctp-auth: sockopts test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9325953
                   Non-passing subtests:
                       =E2=9D=8C FAIL Setup

    We also see the following known issues which are not related to your ch=
anges:
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
                 aarch64 - Hardware - Firmware test suite
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
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: kdump - sysrq-c: kdump: Reserved 0MB memory for crash kernel
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7188004
            Affected tests:
                   s390x - kdump - sysrq-c
        Issue: Storage - lvm thinp sanity: FAIL: mkfs.xfs -fd noalign /dev/=
mapper/myvg-thinvolume1
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1353
            Affected tests:
                 ppc64le - Storage - lvm thinp sanity
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

