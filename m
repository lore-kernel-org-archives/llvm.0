Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D029D288
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 02:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787279533; cv=none; b=iQXnQPXcaP20RymliI74V+ddqwjIXG+7S+R+8K+iry6jRsPP5NdwPW2COs9UDDCNL2HQ2Vc4GyaO8EnP8CgM5SSUlAhci2II0alvpszJJKZ2OoFC2o4/PFnkDK/xjNiSSqfvUK1FPG9W96OA8l2qYVD2IfI5dCb3XGDZxQMncNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787279533; c=relaxed/simple;
	bh=Nog9vTBMIgKNyVNuMiYfYxjSyUgBgaYm0Vr+V6KIkX4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tIKH5ajtcuCN4fbUZEqp2tgAzxy+n9ih2RL+dRaYGwFgwMMNwWOLF+qMDKUU6pXtnVA3HApOrY4I2YqYyeBI3uRMMEdSPYY7MyBq2mMjUVXLTI927+kCR2pnz2997NyJYwBl1yRWkEvDRd9BcGB84WtLCbJh1CZWNbKlFljJskc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JkHHDzzz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JkHHDzzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787279531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SF1uICOpYleq6S2S0h5m7wARJYcAOA4gGxz5Igxiy5s=;
	b=JkHHDzzzEZJWuB5sKADkPVS49D9HT2HXvDAXPpfeOTLiwC8SbYu3doHhpCfjInnjYe2R9z
	O0brkSgaXTezA/WGRyklCWefC0aSdmMB9ZZwk8Yko5B6T8Qk7j5a7dZ1tFMIjmyHigVCUm
	jb61/nyMzDYYatWD8kZ/Fd0LvAbqoG8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-bR5Z68laNbK9Am4e65yM8Q-1; Thu,
 20 Aug 2026 22:32:07 -0400
X-MC-Unique: bR5Z68laNbK9Am4e65yM8Q-1
X-Mimecast-MFC-AGG-ID: bR5Z68laNbK9Am4e65yM8Q_1787279526
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FA7219560B4
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 02:32:06 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D8A3119560AB;
	Fri, 21 Aug 2026 02:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-0, upstream-mainline, c84d3e31)
Date: Fri, 21 Aug 2026 02:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <74469.126082022320700353@us-mta-587.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KCXrKaMD99pLyGYLDiHZ-WM0rcDhFTTuzF1jdUPlX70_1787279526
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
    Commit message: Merge tag 'ext4_for_linus-7.3-rc1' of git://git.kernel.=
org/pub/scm/linux/kernel/git/tytso/ext4

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2777558377

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
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

