Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA335C1A1
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173991; cv=none; b=dgyjWIE9KpEiGsZlciJfcfgKUEiB3q4CmTGfm8dgcMp7k1wIpXqQRbHGt9c0mT9eYno/lcMRco4HC5Rn16gLb4cO0JFhwYWOQT3uwJNr8m//vzzz0QfzWshVyQmLNT55ln3QajG+YB6YBjtqdBOgGdkg3Dptt3Hy9o4yKSKaf6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173991; c=relaxed/simple;
	bh=SOI9OTpTYwopikXW8vEv90NNK5hzeg3jPiw5FzLXT3w=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jwCVeTeZD8mxd2OV72etoCdcs5KF5Vif1XIa/W5ixCMtCO8n8bO0eRHLfZdaEDprByyDOuSrCwzi56TmZgqR7QRC6v3CPAEL0SJeLqmIqug3bMbtlo3tQokjCBVW6qGPNZfgM6urOrkD/c/BpDSgE1jC8+o2o08OAt/eAqy1tgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U8bY8HGQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U8bY8HGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787173988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e6iM9k7TnqGOmGfcKPQsWf0xMwItQL4fWvoHO6o3iG8=;
	b=U8bY8HGQrrjXGDwZMIyqQrElFj/SuoEVXlSBTHgDz8Lv0xicA/TPl8YxXf1kmMWovWVee1
	rheRtxwrVaBH4/yHxy21VWvTjEc9qR+2OXPsEAsNBVt94s/oPqAsQ+DzZnnk4gC+UO21pV
	74axC1sQzzt8OMg63NJPzxkQf6vwpcY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-3oGIuI9FN0GWBlPKqZliJA-1; Wed,
 19 Aug 2026 17:13:07 -0400
X-MC-Unique: 3oGIuI9FN0GWBlPKqZliJA-1
X-Mimecast-MFC-AGG-ID: 3oGIuI9FN0GWBlPKqZliJA_1787173986
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C4E519560AE
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 21:13:06 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7D6543000239;
	Wed, 19 Aug 2026 21:13:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-0, upstream-mainline, e8bf40d1)
Date: Wed, 19 Aug 2026 21:13:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <78519.126081917130701159@us-mta-209.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mGfTWhs_-4H2DK2S4ia_NML6cxQzPzzGqwMHOd0G73w_1787173986
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
    Commit message: Merge tag 'chrome-platform-firmware-v7.3' of git://git.=
kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2773399034

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

