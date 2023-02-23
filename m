Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2B2C9E
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677169301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PoRxWnMILtc1poUfkdJapitfPzy7lO8YaVKuY0mpBME=;
	b=Mw1u+Gq/1PFXyBe9s+tb9b5xVfK4X5eS3uq9UnWSaMgyWyNz+z6IH2ojlQu0pkQi4ucYgf
	xmzFPXTmWCh4k0Kfd4RkfSM4pfqOuCvFiQujT/a8RhZ2jdWWe/EVk4QKx1ZX74jMvPrLVv
	iSMNe/bWn+UC+D04LnJWvoohDN0szug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-MvbaAu0-NDC4p3GAFZrMWg-1; Thu, 23 Feb 2023 11:21:40 -0500
X-MC-Unique: MvbaAu0-NDC4p3GAFZrMWg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AF9A800B23
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 16:21:40 +0000 (UTC)
Received: from [172.64.14.61] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35CD0492C3E;
	Thu, 23 Feb 2023 16:21:40 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (104/381 SKIPPED): Test report for master
 (6.2.0, mainline.kernel.org-clang, 9fc2f990)
Date: Thu, 23 Feb 2023 16:21:40 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <37585.123022311214000937@us-mta-290.us.mimecast.lan>
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
    Commit message: Merge tag 'nfsd-6.3' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/73558

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7229363
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7229474

    We also see the following known issues which are not related to your ch=
anges:
        Issue: Storage - software RAID testing: hit test timeout
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1382
            Affected tests:
                  x86_64 (debug) - Storage - software RAID testing
        Issue: CIFS Connectathon: SELinux prevents mount.cifs, request-key =
and cifs.idmap
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1525
            Affected tests:
                 ppc64le - CIFS Connectathon
                   s390x - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: Libkcapi AF_ALG test: alg: timeout due to an unusually slow =
machine
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1395
            Affected tests:
                  x86_64 (debug) - Libkcapi AF_ALG test
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
        Issue: [rawhide][s390x] avc:  denied  { transition } for  pid=3D135=
5 comm=3D"runcon" path=3D"/usr/bin/true" dev=3D"dm-0" ino=3D17226318 sconte=
xt=3Dsystem_u:system_r:unconfined_service_t:s0 tcontext=3Dunconfined_u:unco=
nfined_r:unconfined_t:s0-s0:c0.c1023 tclass=3Dprocess permissive=3D1
            URL: https://datawarehouse.cki-project.org/kcidb/tests/5628421
            Affected tests:
                   s390x - Boot test
                   s390x - Reboot test
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

