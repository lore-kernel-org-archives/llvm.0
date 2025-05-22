Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA45284B52
	for <llvm@lists.linux.dev>; Thu, 22 May 2025 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953731; cv=none; b=HPjrAsGngJqo0vIx8s7+VAyoYlCqDn7ui4+/c1EJiXltowNRq2199jCUVPHc2ScyAg8Qn2oCNWZcYcqp4zqymj+JYnxHLSm+garY6Rx2XSIyk+mevzHdCiT6BLK0GNCBnuB6/3vfwgnm2GKUDOfHRKGwopTXCEvpGWB52b/sIE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953731; c=relaxed/simple;
	bh=qJPO93hYvj+SNqsKkMDVIX+jvdIOLjk3NrLTl1pUpg8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GQeTZIzR2jiTCpVMVuVT30SFbuj/NaMNYwBk6+55JLL/WbZAB5dyxoxmOLyZHzyv1ZukhuB8Rznp1LeM+ZDqDP9takk0ufbMkyahUc5p2zNC60cJghBq6kLJ3biRFZHgqxfVoMeu8zqd0nlY4c5qpnM4kWdEUv00DqPXzDQfQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P5PqOLBL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P5PqOLBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747953728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gfkwhk+d84NSO+HuTDyOWUi2ADn6oiuf6twi3dUfqUQ=;
	b=P5PqOLBLEAQ2yMRI614u8iqCf/OOhdIzrB/Ezkg1LJrv40ifTMPMoD7SxzHPGCygbLna/o
	nGVnnEuygMcAKDu6JGNIzddidb3tjGF8KiAnNi0/HNtgWm8WDcn/VIw4NuzbjlrHta//rD
	tGgUTTIUdT9NJS3YRkm4SDMAuQcvTzk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-4hI-FUitMmGx4cMD3pPzbg-1; Thu,
 22 May 2025 18:42:06 -0400
X-MC-Unique: 4hI-FUitMmGx4cMD3pPzbg-1
X-Mimecast-MFC-AGG-ID: 4hI-FUitMmGx4cMD3pPzbg_1747953725
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2985180035C
	for <llvm@lists.linux.dev>; Thu, 22 May 2025 22:42:05 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D93430001A1;
	Thu, 22 May 2025 22:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc7,
 upstream-mainline, a11a7222)
Date: Thu, 22 May 2025 22:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <17298.125052218420600403@us-mta-648.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZwqWxo54h8jmlpHNnH_wlSqE0eO5zT3ndLyzZTBzrAI_1747953725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.15-20250522' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1832139360

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1832139360-x86_64-kernel-debug


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

