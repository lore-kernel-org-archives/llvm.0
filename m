Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDEC3BBE8
	for <llvm@lists.linux.dev>; Sun,  7 Apr 2024 21:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712523683; cv=none; b=NcWBC/YJgGWSLj75/4kD6fLppZJisSFU10gvnUcV5yuL/gzlE9ldoufSshqR3WXkBKolWYcJ1vr1vT0M4WtCHHf7mtXVlU7Mlh7dTPmb32y3+nP3SGcVPoqqHp55RHEywM8v41xz3SIKis2aZDkE22oQjMH5L05FleP5/0cyXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712523683; c=relaxed/simple;
	bh=/q6NNiNBcCuhNnyb7xPOK8b5RZXmJof0fNcf6ICg+pw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=T2hI5WN9aV6dy5u9xcjEzLLAXa3Bqm7MjYeGXA0OQT27dJiE9zRsugxunCq2psI+5e+8gCDURH1BANuMYd2Al9KGlIujABuptdQbzBqaFVC4Att+mpFhLL59n4F13Rshu9HnMKgYsYc5XtGYDwVUc32OF/DlPTZX6VAs8VgVnsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=da5PNU3q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="da5PNU3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712523680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yWEORfrfX0MRWN8APEwnmvCaB/qhiWcz60NGeOxjHtE=;
	b=da5PNU3qWncphOR12CgsxKHT5IHlnF3OdxQsJ6guz6o7hSoPoZwHkdwQC0wA6oumoIfn9m
	FvkLo7gvh3IKSqv1s3PZwuIkHRV96T9Ck8LdkMFj+aGH3ZuvnNx/bMc5h2a1ylJ/nlzGmz
	TjWyI1r5eh9IJvHD00KyJ2CVpRfs0FY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-MGbN4t-eOvaaBt-QtzKVLA-1; Sun, 07 Apr 2024 17:01:18 -0400
X-MC-Unique: MGbN4t-eOvaaBt-QtzKVLA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02EFB1010D56
	for <llvm@lists.linux.dev>; Sun,  7 Apr 2024 21:01:18 +0000 (UTC)
Received: from [172.64.13.37] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1D76442D23;
	Sun,  7 Apr 2024 21:01:17 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 5 of 204): Test report for master
 (6.9.0-rc2, mainline.kernel.org-clang, 9520c192)
Date: Sun, 07 Apr 2024 21:01:17 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Message-Id: <49586.124040717011800191@us-mta-191.us.mimecast.lan>
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
    Commit message: Merge tag 'xfs-6.9-fixes-2' of git://git.kernel.org/pub=
/scm/fs/xfs/xfs-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/139425

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [aarch64, s390x, x86_64=
]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [aarch64, s390x, x86_64]
        Issue: [Rawhide] readpage_elf: Attempt to read non-existent page at=
 __exclude_unnecessary_pages: Can't read the buffer of struct page
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2269991
            Affected tests:
                kdump - file-load [ppc64le]
                kdump - sysrq-c [ppc64le]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                AMTU (Abstract Machine Test Utility) [s390x]
                Boot test [s390x]
                Filesystem - Loopdev Sanity [s390x]
                Libkcapi AF_ALG test [s390x]
                machineinfo [s390x]
                Networking cki netfilter test [s390x]
                Networking vnic: ipvlan/basic [s390x]
                POSIX pjd-fstest suites [s390x]
                Reboot test [s390x]
                Storage - blktests - blk - upstream [s390x]
                Storage - blktests - nvme-tcp - upstream [s390x]
                Storage - swraid scsi_raid [s390x]
                stress: stress-ng - cpu-cache [s390x]
                stress: stress-ng - memory [s390x]
        Issue: kselftests: bpf:test_tunnel.sh [FAIL]
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1749
            Affected tests:
                kselftests upstream - bpf [x86_64 (debug)]


Tests that were not ran because of internal issues:=20
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]


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

