Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04465846F
	for <llvm@lists.linux.dev>; Sat, 10 May 2025 06:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746859331; cv=none; b=THYhxXMfuqpuINycGEbSfPu2frf0pex/iHDW5GWcq8NOtQGH/NH6Nq839tRTcLUgYn0kJQ/wgpTm3Hkm4e44K+nFSvX9R6jetuNsMOfTo83gzJbN9upsl+Xp2WvsopHOchWZu312S1EMOVXpqYwE9lS5Whkh/CBaf/g8eP/wmBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746859331; c=relaxed/simple;
	bh=Q9/78u9IeQnAqIZSLk1CFKzYDBXUuLp8w/b3xME2VGQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=EnIehgfPETJBV5CekhWzFbv5H1rcjp4fuo8anFHIiI6ek48l41fT0btCa2EQt5IrijUn0AK9bbUPfnSHtFAxI5ANNlFOPJheSIMoB/kb+z68xowicfwZgD7Pczi6HI0FvYCLNKicDFSI8ZSYsvoVo5HBhtqaa/rVnkq3n45LkFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GP4Rk5Lh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GP4Rk5Lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746859327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VuyG4CkAt/egDft7/yCFC5qfzJES2WoNuDZ/BrBADPY=;
	b=GP4Rk5LhP2X9hs4Il6a/jcL4lgSVmHW/6gMhFlzj93NFf5Mp011wqhYQcUt4U+fT0oaMD1
	dFi3+VQpFMuw4ddsGYhHoWR2hAQ+5ApVZVtRLqMe3hxRGRd2T4D3eJgZh6QUNA0vCG4WBk
	UpbBEZBNFT78SoFphWEvaHd2KX3myyk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531-WvI_Z-rWOg2fTSKnAdUYqg-1; Sat,
 10 May 2025 02:42:06 -0400
X-MC-Unique: WvI_Z-rWOg2fTSKnAdUYqg-1
X-Mimecast-MFC-AGG-ID: WvI_Z-rWOg2fTSKnAdUYqg_1746859325
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 394FF1955DCC
	for <llvm@lists.linux.dev>; Sat, 10 May 2025 06:42:05 +0000 (UTC)
Received: from [172.20.110.75] (unknown [10.30.44.189])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BA7931943282;
	Sat, 10 May 2025 06:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc5,
 upstream-mainline, 1a33418a)
Date: Sat, 10 May 2025 06:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <52562.125051002420600191@us-mta-531.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EdzA_ofDxXQ2tnle12rpesCaZXMyQ0KobPge_Zm3eWk_1746859325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.15-rc5-smb3-client-fixes' of git://git.sam=
ba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1810501256

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1810501256-x86_64-kernel-debug


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

