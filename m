Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2A8F40
	for <llvm@lists.linux.dev>; Fri, 22 Dec 2023 06:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cn/4s3Vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703226017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZsaHqIi4SgpZImeJ7X4b3N3V1aJJjREhrfKSTG7oTAM=;
	b=Cn/4s3Vu4Up6fQ2gIsbHisKeWYoS5dKTmfgprECu9RIgRLsOwY4oD274De7rWixmTw1aDn
	OQIynU4+mUIsV1gwb9kd0P/XnBXv1fbvXOE1Hzg+TFnLCb0pZs1X484geonBiPYjPL+pHS
	bJSACAigUsXSEE4fLjzNVmodPnSeQMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-S-6v_WLZNr6eWu_efuQRkw-1; Fri, 22 Dec 2023 01:20:15 -0500
X-MC-Unique: S-6v_WLZNr6eWu_efuQRkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67BA185A589
	for <llvm@lists.linux.dev>; Fri, 22 Dec 2023 06:20:15 +0000 (UTC)
Received: from [172.64.11.28] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 548FF40C6EB9;
	Fri, 22 Dec 2023 06:20:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 38 of 226): Test report for master
 (6.7.0-rc6, mainline.kernel.org-clang, 9a6b294a)
Date: Fri, 22 Dec 2023 06:20:15 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Message-Id: <78487.123122201201501167@us-mta-642.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: afs: Fix use-after-free due to get/remove race in volum=
e tree

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/120074

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: [rawhide] kdump:  Problem: problem with installed package sd=
ubby
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1819
            Affected tests:
                  x86_64 - kdump - sysrq-c
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite

Tests that were not ran because of internal issues:=20
      x86_64 - kdump - file-load
      x86_64 - Reboot test
      x86_64 (debug) - CKI/restraint
      x86_64 (debug) - SELinux Custom Module Setup
      x86_64 (debug) - machineinfo
      x86_64 (debug) - Boot test
      x86_64 (debug) - Hardware - CPU: Die Test
      x86_64 (debug) - Storage - swraid scsi_raid
      x86_64 (debug) - Reboot test
      x86_64 (debug) - CKI/restraint
      x86_64 (debug) - SELinux Custom Module Setup
      x86_64 (debug) - machineinfo
      x86_64 (debug) - Boot test
      x86_64 (debug) - POSIX pjd-fstest suites
      x86_64 (debug) - Filesystem - Loopdev Sanity
      x86_64 (debug) - Memory function: memfd_create
      x86_64 (debug) - AMTU (Abstract Machine Test Utility)
      x86_64 (debug) - Networking - Ethernet drivers sanity
      x86_64 (debug) - Networking cki netfilter test
      x86_64 (debug) - Libkcapi AF_ALG test
      x86_64 (debug) - Hardware - pciutils: sanity smoke test
      x86_64 (debug) - Storage - dm/common
      x86_64 (debug) - Storage - lvm thinp sanity
      x86_64 (debug) - Storage - iSCSI parameters
      x86_64 (debug) - kselftests upstream - net
      x86_64 (debug) - kselftests upstream - bpf
      x86_64 (debug) - kselftests upstream - bpf_test_progs
      x86_64 (debug) - Reboot test
      x86_64 (debug) - CKI/restraint
      x86_64 (debug) - SELinux Custom Module Setup
      x86_64 (debug) - machineinfo
      x86_64 (debug) - Boot test
      x86_64 (debug) - xfstests - ext4
      x86_64 (debug) - xfstests - xfs
      x86_64 (debug) - xfstests - btrfs
      x86_64 (debug) - xfstests - nfsv4.2
      x86_64 (debug) - xfstests - cifsv3.11
      x86_64 (debug) - Reboot test


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

