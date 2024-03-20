Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BEF36AF9
	for <llvm@lists.linux.dev>; Wed, 20 Mar 2024 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710922885; cv=none; b=Bux2LJicyFFPR2Cq9RdhjI+b+o342yKu8v9b485wt/22hyreHFNK4fW7l8eJTmsg4CpJHz8zlpbhpj6+l+NpF27cNu/1r7KRA+bvdyOexOBEW6ERCntQPZ2d/akBf+L75hdx1jmgFRMJrszQrHD6yzl7qS4gUVBc8R7w2tMZIvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710922885; c=relaxed/simple;
	bh=ZPHp35+EYvgJAYKU9SGQc6oig+2lOlLKBCWiy/378ZM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=pl9NGHHhN+k711mWL1nZ/i6fYqAlc6Y79L/+Un61JaO9bARyrLkMG8NikMLvxKdjrps2NTFiyvW0uLpll9/UvY38yHu2og82tmhsv0e70n7y8Hh+ya/tZgF+NLIVohZqD8sQ3fAUE0WvhzjEgLg2yBsbPSlOjAtgbiIKxZXvrro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d3Ge/X9S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d3Ge/X9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710922882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gfClIdiunGL9NnnzCfZqB58+nNSUaIchYAdINxMELVo=;
	b=d3Ge/X9S0+s9PRw4nP7Ue9TU7bOZWXTkGFOrPvFYbvt9ixLZAl2ZxPbA02yLW9lH7RYNT/
	iC/O+QX7KPeXP4/GpvbS06njTjw+8rwnC15knmgGAlWjpS+4q7yae58RbRy1pQJA3SodQy
	RSQBdXo1S4CblFMRdhgUtmgAMCX5/CQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-yPi-CyQPOti1D-42JnFB7Q-1; Wed,
 20 Mar 2024 04:21:20 -0400
X-MC-Unique: yPi-CyQPOti1D-42JnFB7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D0AD299E75A
	for <llvm@lists.linux.dev>; Wed, 20 Mar 2024 08:21:20 +0000 (UTC)
Received: from [172.64.0.100] (unknown [10.30.33.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56160C1576F;
	Wed, 20 Mar 2024 08:21:20 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 5 of 204): Test report for master
 (6.8.0, mainline.kernel.org-clang, a4145ce1)
Date: Wed, 20 Mar 2024 08:21:20 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <28458.124032004212001518@us-mta-479.us.mimecast.lan>
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
    Commit message: Merge tag 'bcachefs-2024-03-19' of https://evilpiepirat=
e.org/git/bcachefs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/135996

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: bpf-helpers.rst:20: (WARNING/2) Field=
 list ends without a blank line; unexpected unindent
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1405
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                   s390x - machineinfo
                   s390x - Boot test
                   s390x - Storage - blktests - blk - upstream
                   s390x - Storage - blktests - nvme-tcp - upstream
                   s390x - Storage - swraid scsi_raid
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                   s390x - Reboot test
                   s390x - POSIX pjd-fstest suites
                   s390x - Filesystem - Loopdev Sanity
                   s390x - AMTU (Abstract Machine Test Utility)
                   s390x - Networking cki netfilter test
                   s390x - Networking vnic: ipvlan/basic
                   s390x - Libkcapi AF_ALG test
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                 aarch64 - Storage - blktests - blk - upstream
                   s390x - Storage - blktests - blk - upstream
                  x86_64 - Storage - blktests - blk - upstream
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: [Rawhide] readpage_elf: Attempt to read non-existent page at=
 __exclude_unnecessary_pages: Can't read the buffer of struct page
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2269991
            Affected tests:
                 ppc64le - kdump - sysrq-c
                 ppc64le - kdump - file-load
        Issue: makedumpfile failed when dumping vmcore
            URL: https://bugzilla.redhat.com/2269991
            Affected tests:
                 ppc64le - kdump - file-load
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
      x86_64 - Memory function: memfd_create
      x86_64 (debug) - Memory function: memfd_create


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

