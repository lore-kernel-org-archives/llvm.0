Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3353E2E3385
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 02:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743560531; cv=none; b=n+8wEnAutLNUTH5Npuy0NIsypg/EhFPhj1O3Dg4XzH33927zg2Ol6j5OOweMh6pAso6LsyKrQQoSYE99Go7N5FNxrktSXc4VPoP39tRsQDUd3mvfSNzYenWTqJGrgffCzjiOLQ9UHNF+K0ez6lO5xoz0aPI+K/Z6NleEC11AWa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743560531; c=relaxed/simple;
	bh=Vca1+a89UA+vmUn92q0Iguh0364MFZgLkh1ccT/MwmU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ilgROhuDtjsJtKTyPtC3om7vgA4kda0b7tWpmHW+7FFc2bInGYIpigMy4FWC6oPL25baDVw1OMV6Yr+6DXqYm0EEOQGiwAFh0kYfFF+6ZGnkGDpM1I0r6CB8zApohifztcFKCMFYhEzptuiT0bjp+B5zMEC0fo4Hgz0bR1hA3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eCB7Qo4a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eCB7Qo4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743560527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5ZNCULQb8AmTF7ZfvuprM4yEBzzl/oxf3fQrlDRGAEs=;
	b=eCB7Qo4aeKKzO+vq8czF3rNZcyOcfWjlnHO8OnkuMLgwNd1h/XniZHuYjHMwt1Fvd6+HIc
	vJhTQyRjr7Lw3OxzYf3JAw7WmMhLotW+wM6uAikcdjDaQBBtbkKEojKCiCfQglH+JayNCk
	6bQn+74vmePokgqrCSvIMbsN+LCGNzg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-538-50i5V8bEOSS9Z4THzClLXQ-1; Tue,
 01 Apr 2025 22:22:06 -0400
X-MC-Unique: 50i5V8bEOSS9Z4THzClLXQ-1
X-Mimecast-MFC-AGG-ID: 50i5V8bEOSS9Z4THzClLXQ_1743560526
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2E751800259
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 02:22:05 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 771A919560AD;
	Wed,  2 Apr 2025 02:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 792b8307)
Date: Wed, 02 Apr 2025 02:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <01240.125040122220600584@us-mta-538.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: atasAqqchTaXHwcubORICjyJg23-VvKgjDiEc4wfzR8_1743560526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'edac_urgent_for_v6.15_rc1' of git://git.kern=
el.org/pub/scm/linux/kernel/git/ras/ras

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1747586012

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1747586012-x86_64-kernel-debug


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

