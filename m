Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AB34597F
	for <llvm@lists.linux.dev>; Mon,  1 Apr 2024 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711984299; cv=none; b=ISe9CnrbzI8KX38BfTExnUjWoZexzRUA0eToJx2FLbNS3upk1UhSwFj9jF/9zenEN0ie4FX8GKh6al6R8+5pu5rseC6Q430oH196ri20ShGQA2GeYv3f/2iCNxcpC3PZ4Js12u2132BY9cAOJiFkVCr58+cJiWSySqOs8ysqvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711984299; c=relaxed/simple;
	bh=86ZQQ5Uq9TkXFJSKVZKCmZCgMmLMvLY2pYrw4c7Z8sU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ADbkEQ4rc0ek8ZnpcOaMKHW/TYcRy0v5D8arUYaQ8R6jnENvdV+8y5Jf1VvMRonEpL4jnnWEQwKmvD3wzuGJHLxcSWshYHzGKULtMSZM0ZRuGHY6FKXJhOi/aZwsrfcw7mnSHPnBnYgT/FQg4irb8k8LaiMpHJoN/YB0TZSU/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QMfrgXby; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QMfrgXby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711984296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PXVLg/2lMpnULkaQkI8EA8C21o+V5L8oD8VhzgYJsRE=;
	b=QMfrgXbyGozJCGyrLSHzaIeAvPR0H9+s5F9qbRjSWz6ss52arre5zlEIAJjqapRM3oOdn2
	uvycXd/uzwJqSLIopKeCYjvYpfeN+qYTC2lREJpMp8oGhrMFftI/Hv22oga2yMD+CkqHDM
	PuUw64838M2e+GOc4Rk5DcnyLHo1YOI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-7obriI1NMLuh3g5E_-r2Zw-1; Mon, 01 Apr 2024 11:11:34 -0400
X-MC-Unique: 7obriI1NMLuh3g5E_-r2Zw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7D42101A56C
	for <llvm@lists.linux.dev>; Mon,  1 Apr 2024 15:11:34 +0000 (UTC)
Received: from [172.64.11.58] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 551FF40C6DB3;
	Mon,  1 Apr 2024 15:11:34 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 8 of 204): Test report for master
 (6.9.0-rc1, mainline.kernel.org-clang, 18737353)
Date: Mon, 01 Apr 2024 15:11:34 -0000
To: xzhou@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Message-Id: <54549.124040111113402469@us-mta-93.us.mimecast.lan>
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
    Commit message: Merge tag 'edac_urgent_for_v6.9_rc2' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/ras/ras

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/138180

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11856691
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/310

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftests: bpf:test_tunnel.sh [FAIL]
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1749
            Affected tests:
                kselftests upstream - bpf [x86_64 (debug)]
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
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                Boot test [s390x]
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
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    kdump - file-load [ppc64le]
    kdump - sysrq-c [ppc64le]
    Memory function: memfd_create [x86_64 (debug), aarch64, x86_64, s390x, =
ppc64le]
    Reboot test [ppc64le]


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

