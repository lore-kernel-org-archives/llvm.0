Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304FC2CA6
	for <llvm@lists.linux.dev>; Sun, 13 Apr 2025 00:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744503730; cv=none; b=oqyZPDQ0z93T+6P8WobZCNV3FbbIPw013mUz+uJrqdensMkeTyXtPaDOzADELE8FTK7Kmg5h7tPZ33Nn/pQREzChWGlY7MqcRB28xI07wuyNvcQa3zoJMEvb9LlceTsRbuTkTggSRr7HZitwW3kxgys+t8+LygaaTOc/apu5ca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744503730; c=relaxed/simple;
	bh=iVdBbMGbCSf1tWtoPoofQMHaJ4hfFW2lYAZn+LbKFBM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=E47LAdum3McUY5GkxOFTpJs/ai35TB9vVp0ZUa3mPGS74kUGHzl6z2+0+V9Y3FvQ02oLlUT27VYoDeYLbpWey6nrxeBGdDP8Kycfx2rHCvV/aZo8vbPD9DNytEXX1uraPE2tOqmLgy7q/mIGFaNTyK7NdiDt07vMMODfFjaU9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DCZmwhPV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCZmwhPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744503726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CUTecaFfqHgdDPTE2U0exgL4gSJaiktJ1dDQlLeOwvA=;
	b=DCZmwhPVEL2NSZ50gsmxNCcyT9+ix04/WafJmuj46ZtahMgPmV1OAUUVYurX8uYMcvf8ZN
	g8ivCFkgDN2iJUtpudCJxQAxtDPKnQsGcQOiG4GGkp5hrsv0/RUZbAcfdFqr56LLjAn8hZ
	RZr9THvIrqJhRlOYG28LWMI5se0q/pA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-gy5yKTRlMxevuzJ8Dz3IpA-1; Sat,
 12 Apr 2025 20:22:05 -0400
X-MC-Unique: gy5yKTRlMxevuzJ8Dz3IpA-1
X-Mimecast-MFC-AGG-ID: gy5yKTRlMxevuzJ8Dz3IpA_1744503724
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81DE11956087
	for <llvm@lists.linux.dev>; Sun, 13 Apr 2025 00:22:04 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3405718009BC;
	Sun, 13 Apr 2025 00:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc1,
 upstream-mainline, 7cdabafc)
Date: Sun, 13 Apr 2025 00:22:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <99843.125041220220501186@us-mta-645.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P5iZrzObwl6pIsmuENjE5suKFgT4TXZeKYf-z0EvKjo_1744503724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'trace-v6.15-rc1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1765821389

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1765821389-x86_64-kernel-debug


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

