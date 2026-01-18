Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B023224FA
	for <llvm@lists.linux.dev>; Sun, 18 Jan 2026 05:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768714331; cv=none; b=o9eYydQJQRyMU5E6+yXgLjmC02p4xPycIE48HV1mOMySBZHhCb/v/gTIbNezXmdULXcmTnRtad81fa+0Xkl+BJ1JV1ZDZDW0vFhuDIutoF1DBC53ifZovJJlFz++wk+HMRCp4lTFaSwKVVZuW3BbDu5wq/BP/q+oV8abOJWPesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768714331; c=relaxed/simple;
	bh=fuoMutvfNAeJazICgLnkTtplFCRubJVYz4QG9tlz4jc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CQ8LMTppX7z50vbq0TZYIofUMtH1EN65GEC/oiiB8mD9YsO13vO9OXUzAJhsw8swkm3w3Y1o7cmjc80OFUsJgUougfN5JKCj36x4Xx6n6PoM3FA///D4H4VrSAKP+ahGVLBaaaSpZ/txIZH6QHDLlihC3xtjXow6A4FgLKw+qf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRrzkFOg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRrzkFOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768714328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vn4c0cCdeG4Fc1rd/bPJ2yaqIH6MiNKFKsQIZyBkUfw=;
	b=NRrzkFOgfZEqaYsiKuXcDCCzT9g4m5/X1ugZ+vcbbP4b/mGYSqptef/YVs/IY7jx8i/V5W
	EHrr/RQP/Sb4V1qKAOTwrH5EGUGJvMBYSMdMENvey933FyJRUBg116uzQWeWuwWkn/LFT6
	aPitpl2JhClsJGn4x2hBj8y/yQklr/o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-yWoz5y2PPXOVfo-WlRBGLg-1; Sun,
 18 Jan 2026 00:32:06 -0500
X-MC-Unique: yWoz5y2PPXOVfo-WlRBGLg-1
X-Mimecast-MFC-AGG-ID: yWoz5y2PPXOVfo-WlRBGLg_1768714326
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D52621956050
	for <llvm@lists.linux.dev>; Sun, 18 Jan 2026 05:32:05 +0000 (UTC)
Received: from [172.20.95.168] (unknown [10.30.44.183])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 87F431955F22;
	Sun, 18 Jan 2026 05:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 81 of 110): Test report for master
 (6.19.0-rc5, upstream-mainline, d3eeb99b)
Date: Sun, 18 Jan 2026 05:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <38719.126011800320600212@us-mta-483.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4TUDVeH6Y9Cp6FvkohatLFUmOf1BY2uaVykcOMmZg1A_1768714326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'block-6.19-20260116' of git://git.kernel.org=
/pub/scm/linux/kernel/git/axboe/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2268507827

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2268507827_x86_64_kernel-debug

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, x86_64]
    /distribution/command [aarch64, ppc64le, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, x86_64]
    Boot test [aarch64, ppc64le, x86_64]
    CKI/restraint [aarch64, ppc64le, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [aarch64, ppc64le, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

