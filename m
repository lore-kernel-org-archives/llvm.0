Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2A122DF8B
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 04:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743567731; cv=none; b=mj6P0Ux6PgVP0RoMXFVchIK2XDRjIjgNIICOCLDo+btYtIKvvltXE/xPji9MezhB6epi45i5t0Yxrlwtu4fOKmnLFOhkvNbdaNzfa3YZrIXHRpOFdAywAFTZ7WL5uRwPUGamq6EgPtJieSK9ur4lVajGfO1zTFdfpzhiVwsRDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743567731; c=relaxed/simple;
	bh=lgwrHFCla5/Z7XOCm5uIOPHVZJVGr6SaIo8Covvv8tk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ur32k+6o/6Q14SE+W2ubse/BkbfMsI8l3fxLsKiXOJjDeWFg3fSIFAEgDEeebHFwPSdD8dYZNeWKNgSr19razwye4MjX5tHDRdv8DBKDGWRhQ/ZyL8dL+mI/NXAv2UEBFeaCDpd3GfQrP2uqUZ0r5/43Ilk++FB06WlpfiKpaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vnbl3wah; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vnbl3wah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743567728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SAao+TS6k20r30IVZ3Oake75c6JTpV6/A/uJ5IKPqLY=;
	b=Vnbl3wahmhWaPM/LCC/gyz3grOvM0vCVE1knrDSj7uJEyL9H1yQUlgVs2MC8w+zjFHKLXZ
	2sRO2FOW3KCtoeVVv+Ilp2nhucE83aRV7KrXF8Tqt594wxrbqcmRrXMrTBqAvrvTEeETuV
	yyA/ccrZbW3C59DXNS6yS6Pc8ykEM5g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-246-0bG797mQOZ6eVAByaudgrg-1; Wed,
 02 Apr 2025 00:22:07 -0400
X-MC-Unique: 0bG797mQOZ6eVAByaudgrg-1
X-Mimecast-MFC-AGG-ID: 0bG797mQOZ6eVAByaudgrg_1743567726
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DC221801A07
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 04:22:06 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8B58919560AD;
	Wed,  2 Apr 2025 04:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 3491aa04)
Date: Wed, 02 Apr 2025 04:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <56641.125040200220700371@us-mta-246.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xQsZ4Eckchzb815BcRSy3hAOAVkSAgiVdSCCt1WaazU_1743567726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'vfio-v6.15-rc1' of https://github.com/awilli=
am/linux-vfio

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1747680670

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1747680670-x86_64-kernel-debug


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

