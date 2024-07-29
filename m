Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756197D3F1
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 21:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288790; cv=none; b=S7WLYQfVA1hr7lj8jkMJ/HYycvDqvvEKmBDkocP5igp3r5+251FMnT5RWUMcCbQ7KRuSwF1S16c4jeOTZtWoqY72SVdSaRCYSkowg+lmVPGJ3xmIRUHBxzFx1hECBjJbuX1mABzbIAByBFBRKmDBFfl/qmwuoPrXuE8UF1Rcgrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288790; c=relaxed/simple;
	bh=6delc86fOl6L0BprwcuYWR2Hao8cc+P0djPDJYiP9Jc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DcTcruqbuBZp2q/0TR6bI9sjpo/RCFpBUvOJolmazKQ+hPoNsX8caY5GQJbI6Hy3b+iJfHQmUtFwiSO6X0/oST5sh1PAxFK3+kNpvRyY5uNA46Sf6d9tdqUj1EM3aEmOrvLSv19gymt1wZ/792+0VbeOgD0kJ4CoovUQnpKFx3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFl9eW7n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFl9eW7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722288787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wmtNKKLpJ04byqsTNgiO3rkgHODvEFjJ1FcjwnxOX4Q=;
	b=FFl9eW7nrtn/+J2L2KFQm362nZLBU7VMTGrlUh3LFWcr+ypWBU18/A/2wiETjF40LK1PsR
	ugc77CEKuj73swqtNwje8SRnqFjTE+MqLRXJtSVIupiHE3vDoRBdnzVrxqCL20RcHxYcjJ
	hkBFP9JqxQKz3xUZupPsMRVhO2aD9lw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-_RnB3R9hPMi91Tp4RsnhrQ-1; Mon,
 29 Jul 2024 17:33:06 -0400
X-MC-Unique: _RnB3R9hPMi91Tp4RsnhrQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67AE4195609F
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 21:33:03 +0000 (UTC)
Received: from [172.64.1.77] (unknown [10.30.33.143])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0E41300018D;
	Mon, 29 Jul 2024 21:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, 6b5faec9)
Date: Mon, 29 Jul 2024 21:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <93458.124072917330600143@us-mta-145.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus-2024072901' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/hid/hid

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1392674114

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1392674114-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1392674114-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1392674114-x86_64-kernel-debug


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

