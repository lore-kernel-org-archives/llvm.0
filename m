Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717AF2848BA
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 05:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764738730; cv=none; b=nso3r/IaM1rBJQVp1kLHeWUow52PSvAng1r8bn/wUGWKy+rKLhW7xjgLZD3jsKQasEgPuprtOkH+bBYq1HB/I6Peugff+lB88aWe78g0/n2W6xC8EBe1zYLsjWL9f4zyczmgaQNb9IJD/GfcHE5NmF1wziLt2Q2l9YWwT74pxlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764738730; c=relaxed/simple;
	bh=AQAELTFk3N25AEY1Ckf7l59Rd9TUeVdlSeNGK6dSHK8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GqWqgkATwaJBP52rez3QSBYiXKkKT+1BwfX/lIiRCxj7SBnBjgzsE0Dzp1tLouBq7vsGvkZMvDtpec3oNqoC5k7YrAfaPF7remBDE3CrqLxohhZ3G7ndXQnpWoOl871yxgkvnu4QI3/TLYwxLwmNLx88boLYI1QRkdphv/8417E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EDgdlnVI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EDgdlnVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764738727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bzH07uRAOgcJppPLsYYbDARwTCo56VXJuuCOx+Gueds=;
	b=EDgdlnVIk09DWbVzI1ojVYzxLG2AR9veQsjMuqEDjAzRX/5u3cmS0U/OdDFt04bCSZh5GI
	8zw7kDyfvIsUiuCeN9cA++MkSbDEcfusVLusNYQOceeJO8pGRER0zC1THR8Dzt4eMBKAAs
	4mRqDj56bbAy2664UApa/WzX50bquh8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-134-stebzZpWOmeVdHkDk_L-fg-1; Wed,
 03 Dec 2025 00:12:05 -0500
X-MC-Unique: stebzZpWOmeVdHkDk_L-fg-1
X-Mimecast-MFC-AGG-ID: stebzZpWOmeVdHkDk_L-fg_1764738725
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DACCC195605A
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 05:12:04 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 794D3180035A;
	Wed,  3 Dec 2025 05:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, 3f9f0252)
Date: Wed, 03 Dec 2025 05:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <80047.125120300120500301@us-mta-134.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WJNeOTuSTaRXZmbdVhNQy9aHYgc9dd2_jrUoD1sBohc_1764738725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'random-6.19-rc1-for-linus' of git://git.kern=
el.org/pub/scm/linux/kernel/git/crng/random

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2192729573

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2192729573_x86_64_kernel-debug


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

