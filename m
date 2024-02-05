Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D04944C64
	for <llvm@lists.linux.dev>; Mon,  5 Feb 2024 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707151313; cv=none; b=LRIEFXt8Bve7u+f9oYQDezJ+EdHi4VxZ2jrOFMd5U7/tmUz1+wxFVvv8FZyjyY1PY3wjgTlEgoJH/bLnj1JsPyAY2jt8eZfFrVprslVBSSztOoXEFoqkmG/OGC3LHCE61V2zRg96fcN32P8C42N9acmL9qQi1Yc7k805txBoL4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707151313; c=relaxed/simple;
	bh=6+k/EVfCmrgNVghTorWb7aBKCaylz9gHTg2ACoTd1DE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=j0MBbmyG0MRpzDBH8JUzG6A0x3rAfiX54HhU9/B2zmmxcNBoeTp8riEqn4qfE1vvm+kaHJq1FF3F85jXM6+j9hJJevFn8vtXtzdfR8YyYO4I9qqUESaygEfBV0vpQUjKf0t9o8130c3aRitPCjciHJWRlC26xueRubwRdw8verI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vu+Bn7u9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vu+Bn7u9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707151309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jk52oTJw+Z0hJYEBXnpD7mg7MDsMVAkPlFnLJIeeClE=;
	b=Vu+Bn7u9FHvtAHaNQ8w6t8vOZImhy8/AFEq+hiSGCGnSWzLdbz+mjeLs8cx+JDg4Hc3wZF
	x78SKNTiEZlZ1JyJru7C7LH1GFkLgxZTpX2jJCVb0Vgrkps8AiABLfH32IZGwR597gB6Un
	UInNQvkCQTZjESPH0gbocOLgDqK5jsA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-FwPW62kcOraK7qKIAZLDWQ-1; Mon, 05 Feb 2024 11:41:48 -0500
X-MC-Unique: FwPW62kcOraK7qKIAZLDWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADE5D85A588
	for <llvm@lists.linux.dev>; Mon,  5 Feb 2024 16:41:47 +0000 (UTC)
Received: from [172.64.10.24] (unknown [10.30.34.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A34051D5;
	Mon,  5 Feb 2024 16:41:47 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 12 of 226): Test report for master
 (6.8.0-rc2, mainline.kernel.org-clang, 3f24fcda)
Date: Mon, 05 Feb 2024 16:41:47 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Message-Id: <66066.124020511414800567@us-mta-642.us.mimecast.lan>
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
    Commit message: Merge tag 'for-linus-6.8-rc3' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/tytso/ext4

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/127532

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: blktests nvme/ failure due to latest nvme-cli update
            URL: https://github.com/osandov/blktests/pull/131
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: nvme authentication setup failed observed during blktests nv=
me/041 nvme/042 nvme/043 nvme/044 nvme/045
            URL: https://lore.kernel.org/linux-nvme/CAHj4cs8vqrePA-TE_GGNAZ=
LG3iqZBq9L1GkanA4A0wRF_TXDeA@mail.gmail.com/
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: [Rawhide] nvme-cli: hostid/hostnqn warnings to verbose level
            URL: https://github.com/linux-nvme/nvme-cli/commit/252929069d6c=
9042e9c95f41788006cb3eb2f452
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: [rawhide] avc:  denied  { read write } for  pid=3D12364 comm=
=3D"plymouthd" name=3D"kmsg" dev=3D"devtmpfs" ino=3D10 scontext=3Dsystem_u:=
system_r:plymouthd_t:s0 tcontext=3Dsystem_u:object_r:kmsg_device_t:s0 tclas=
s=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2256442
            Affected tests:
                 aarch64 - Reboot test
                 ppc64le - Reboot test
                   s390x - Reboot test
                  x86_64 - Reboot test
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
      x86_64 - Memory function: memfd_create
      x86_64 - kselftests upstream - net
      x86_64 - kselftests upstream - bpf
      x86_64 - kselftests upstream - bpf_test_progs
      x86_64 (debug) - Memory function: memfd_create
      x86_64 (debug) - kselftests upstream - net
      x86_64 (debug) - kselftests upstream - bpf
      x86_64 (debug) - kselftests upstream - bpf_test_progs
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

