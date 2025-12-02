Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1AE2DFF04
	for <llvm@lists.linux.dev>; Tue,  2 Dec 2025 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764706934; cv=none; b=sC2mIwuUVS/LM8VAy0ADczwWpEVpugsREsrkjPjVj9wy7GlmrmXKdyk17hDKkCZACr8couY92OfULbvEeatf3MbCe3vxAZsZ4fUVcuabuo5ljjSMjoem9Kl4twbepsJ4otuLvuTuLUHNBELzoeGReiV4TDDgQeYSipElvzlY8ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764706934; c=relaxed/simple;
	bh=0lD9pdWflZtUsZbn7YinWco9smwPO2xfBoXYAP8Kuck=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Mx6Y+G3ExA/NKg8YUvXdoOFIxaxaxzs2/DR1ryezKZlDsa6+VFcvJQR7yt1lIbBCvO/FmWQurpbthf+s5fOyC5xj6QxyZjCXYK/EgVN+/RMjz1FVJh2H39a98EvR1sS0gpitlKTPRIu9eDAo0ZJdROUE4rR8/+IkR1RRwPdmk0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EeiAu3BK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EeiAu3BK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764706930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vY1gkEmcPFn9jPEyp+xDQb2JFXjTaZxUbRS1xX2/VQo=;
	b=EeiAu3BKUGZchWN3oZteFRY5UX2a+uFsSconjTaFuvKAWL4fMfryQBVDwPDhg/9V8qVRd6
	u1lO4neJnHRgoTlNg0fxDXckFDieU6+F3U/UIrBEWKADQfTdwOmeeQLupxybniP1rjOGpj
	1k1qnTYBdcx2/S9xtkKHRta+rJMr9ns=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-327-WP5fMB47Mdul46Z9HguzZg-1; Tue,
 02 Dec 2025 15:22:06 -0500
X-MC-Unique: WP5fMB47Mdul46Z9HguzZg-1
X-Mimecast-MFC-AGG-ID: WP5fMB47Mdul46Z9HguzZg_1764706925
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 536281956056
	for <llvm@lists.linux.dev>; Tue,  2 Dec 2025 20:22:05 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E4E873002D0C;
	Tue,  2 Dec 2025 20:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, 7f8d5f70)
Date: Tue, 02 Dec 2025 20:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <99156.125120215220600487@us-mta-327.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0IkdfldOSElF4IcDjFtiP7oFJtnJ2dP_Gf1ZmMyvhIQ_1764706925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'core-core-2025-12-03' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2192058642

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2192058642_x86_64_kernel-debug


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

