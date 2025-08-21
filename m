Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50735E4D6
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808995; cv=none; b=nr6E2Qjp4M41e9Yc5j61Y4sFB+5V9osb34alxXvkoA1kLLz/2kh0ZjCOSAiIGuoRISmE3pUPX7NMzxUZODZ/BNY3mneY8IU5T9O7pWR2T/V7qKwe5FeTZFRnx2u4nDw0qg4FaBptUvgST7tERU2V8nTjxeFqBEEqfJnlnNkRnsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808995; c=relaxed/simple;
	bh=39130TZHBk66sM/WSijRxoWqW9bjcKop2gbSl9jctDM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=uKT5didAORo5C3n4pxMc8+tM45VA4nnJIrsdud5VjaJQp1y9b/ZOYY+h5BgNV2sWnVCimgbaTDWcTsH1eyOXbZErpGc/OcwzOkO5P1z2wggvP4vtBAHoKdc0QnNKa/sXivklzXNtoeVNj5VeB0iETh2IMgJgWO2feBiGF12wQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NzM/ucVe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NzM/ucVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755808992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Ld2+YE7oNdrd73Uj/esgRjPqbHPbqmNLd2D4sxhDpU=;
	b=NzM/ucVeLm0lCUjIhe2/2U2LXW5ROtEXRKEJk63/1ySeIqFABsA58MIWphviTd2MymrBET
	joShaESlQM2gnkQXxRSStcwec75ro4yomXbXa4qeEetkX/uvaw1CTaMHqDilnEFTUSP+eu
	qylLj2A1Ut/UPMUk4s1FfTDG5g5p87o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-240-Zp0EwY8hOt-jQtaNZXlZzA-1; Thu,
 21 Aug 2025 16:43:05 -0400
X-MC-Unique: Zp0EwY8hOt-jQtaNZXlZzA-1
X-Mimecast-MFC-AGG-ID: Zp0EwY8hOt-jQtaNZXlZzA_1755808984
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CEA61800294
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 20:43:04 +0000 (UTC)
Received: from [172.20.48.110] (unknown [10.30.45.91])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E2F781800296;
	Thu, 21 Aug 2025 20:43:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc2,
 upstream-mainline, 6439a0e6)
Date: Thu, 21 Aug 2025 20:43:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <70489.125082116430500759@us-mta-240.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9UxALmdSyvkjMLblTWqdKcXGeqA5FF7pRj_EBedQ144_1755808984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.17-rc3' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1997140179

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1997140179_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1997140179_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1997140179_x86_64_kernel-debug


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

