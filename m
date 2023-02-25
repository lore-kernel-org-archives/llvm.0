Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D4E19B
	for <llvm@lists.linux.dev>; Sat, 25 Feb 2023 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677333700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rAYs1STp2TT9NuwJOfO0FMysiPkPCctmO4CiVqHuDU8=;
	b=gopQp+Yzq2WiZXZLbpDcELftdAKlOhYa8YUOdAvRXWbGf0eY5TG6v1TPbD+ZDf0Lj07kUM
	h8/a+VGSXLBRfqBwqhkgSvzSQuYLBMZESgE5o1x+lq9CLDhvyDSl1e8ASIAM/dtLBsaEia
	12SFXs2U2btRizDkSPQf4d2rL0Xj6K0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-fW8ha3pNPc6g-wuTaz_0zQ-1; Sat, 25 Feb 2023 09:01:39 -0500
X-MC-Unique: fW8ha3pNPc6g-wuTaz_0zQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8FD6800B23
	for <llvm@lists.linux.dev>; Sat, 25 Feb 2023 14:01:38 +0000 (UTC)
Received: from [172.64.14.61] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 962151121314;
	Sat, 25 Feb 2023 14:01:38 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (104/381 SKIPPED): Test report for master
 (6.2.0, mainline.kernel.org-clang, 595fa4e3)
Date: Sat, 25 Feb 2023 14:01:38 -0000
To: jbastian@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <70640.123022509013900175@us-mta-74.us.mimecast.lan>
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
    Commit message: Merge tag 'soundwire-6.3-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vkoul/soundwire

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74134

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7260888
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7260690
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7261255
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7261263
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7261311
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7261317

    We also see the following known issues which are not related to your ch=
anges:
        Issue: CIFS Connectathon: SELinux prevents mount.cifs, request-key =
and cifs.idmap
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1525
            Affected tests:
                 ppc64le - CIFS Connectathon
                   s390x - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: Usex - version 1.9-29: FATAL ERROR: zipinfo returned exit st=
atus: 3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1543
            Affected tests:
                  x86_64 - Usex - version 1.9-29
                  x86_64 (debug) - Usex - version 1.9-29
        Issue: kselftests upstream - net: FAIL: Ping received ICMP Packet t=
oo big
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1571
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
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                   s390x - Storage - blktests - blk
        Issue: kdump - sysrq-c: kdump: Reserved 0MB memory for crash kernel
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7188004
            Affected tests:
                   s390x - kdump - sysrq-c
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

