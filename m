Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41022201278
	for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776238331; cv=none; b=O5NUkswZuStT9IqfwTh/XsMV2O9gAMVuYMz67yt8ZxSDKMcEJH8gWBEjneF8VYnXG3nXSjNL9OR+jXZeixJvuBWyoxz4uP3HzNtIekFguFkx477r4aOCoD4fvI39Yz2P9tYCa4CAni6ml5IzJdSb8OKcz/wqHu8InUrOlYhfvhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776238331; c=relaxed/simple;
	bh=zedbk22vRhY0wO5Si/GzmBfib0mACFyFCdbBHPn8INs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hJUtTZOb4NTkpVoWPTc6RqmU1Km+I6PyCNjRC6nYDNdpQjoO7t/OxJMWTowXIXvqO/hZgFQ+PTHz9o8me61DWv4LknHBvWPEGL3SPOTqWiJuWcKrevK5/UL+e3MkmBZLGocB4blDLPeyb4AgsA+laAYzKwzo1ebooPWJYmPsz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PK5TaxAG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PK5TaxAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776238329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ptaF4S7UP+icMXc2YUQdi6wmrbjmOndXsqNV/yquaGM=;
	b=PK5TaxAGSXije6m+iBjb374RGwUKaXD0f1iapf+NexiQGJQvWC4w1p9+2vry/ycNU/QZhz
	crZI2+LKtC7BWYEwGdg1t+esVTUuFpx8+YCe5nC3Rf9dcJI2VGEMBAfal8RnZ5SmlDU4Rq
	uy2cQF5oRNqmWEOW87kwhBVndQgzpsE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-utzCzclRPVGzTo8ZsWzvWQ-1; Wed,
 15 Apr 2026 03:32:07 -0400
X-MC-Unique: utzCzclRPVGzTo8ZsWzvWQ-1
X-Mimecast-MFC-AGG-ID: utzCzclRPVGzTo8ZsWzvWQ_1776238327
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B6021800464
	for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 07:32:07 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B04EF19560B1;
	Wed, 15 Apr 2026 07:32:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 88 of 97): Test report for master
 (7.0.0-0, upstream-mainline, 883af1f8)
Date: Wed, 15 Apr 2026 07:32:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <91312.126041503320800124@us-mta-554.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f6OgjgTRHVAoaLA7L0wPYKFxmoNR3ot8qMHspg7DETk_1776238327
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
    Commit message: Merge tag 'x86_tdx_for_7.1-rc1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2453308703

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x, x86_64]
    Storage - blktests - throtl [aarch64, s390x, x86_64]
    Storage - blktests - ublk [aarch64, s390x, x86_64]
    stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
    stress: stress-ng - memory [aarch64, s390x, x86_64]
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

