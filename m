Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4698F7D
	for <llvm@lists.linux.dev>; Thu,  2 Jan 2025 22:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735856531; cv=none; b=JXBl1zPi3ZKgZRALN9mtCO8YpPMrW3U9IZjaZCIhyuP6rSB6DYRKltFSU0N3zXT9xATtGfVt8JTmU1WzImGdE3gctMhaJ/EWGu7bnvUewtRj+kWwW5XTnuWRAUxhr3BFVzfsDAz/wjM7hEmKcRapeRZ5gbWXf+AaVEmuHY40Tjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735856531; c=relaxed/simple;
	bh=lCtTCYo/Z/6Si+b0naBfpzeeTMrDUslrCDfByRJPP4k=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=X9qEwg4vjqAuVeMruB+8kRtyq8GmYpWXoBuM7wXdNqIK3bf5IKgvFIiVLpM8X9+ojF/7geNcab9cQSd9at1E1uQZPrcago+tbZO6NxvWIrT3hCY+qbFEPm+sSGwU6RP71ZyDPoPvhYm9c+SDXSsDg+OpsSTmlpBwrEfdzL3mgno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SdYDmufc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SdYDmufc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735856528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kHklqH83oWnxmhn/gpUItLOUMvS3Tih+uK9Fbnt013w=;
	b=SdYDmufchiEVhtQ4/2LiPCqIPKRKHBYvjt9yQ7FitapA6KCdBOXGPvj3//tj/ovBzb62Wu
	xqP6ip42OMIxdv0COZrgMOU0tiOyVfX1cPJkVHXHPEss7ELQ+RAxeJrfeSNT/shO2D7919
	IvxEQ32fLMJ4aDUuqwbpuUqySv2zmas=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-yJ3dyLi1OfCXJvHFQkC_yw-1; Thu,
 02 Jan 2025 17:22:07 -0500
X-MC-Unique: yJ3dyLi1OfCXJvHFQkC_yw-1
X-Mimecast-MFC-AGG-ID: yJ3dyLi1OfCXJvHFQkC_yw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 309BF19560AD
	for <llvm@lists.linux.dev>; Thu,  2 Jan 2025 22:22:06 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.32.189])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B016219560A2;
	Thu,  2 Jan 2025 22:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc5,
 upstream-mainline, 0bc21e70)
Date: Thu, 02 Jan 2025 22:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <42142.125010217220700555@us-mta-532.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: usxLXlMdqX8gE_qTMX-XhufbMxSuasHaFWkU7sBQGbQ_1735856526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: MAINTAINERS: Remove Olof from SoC maintainers

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1609422049

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1609422049-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1609422049-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1609422049-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

