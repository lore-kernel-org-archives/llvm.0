Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9601B0F31
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747284732; cv=none; b=LOtiQnub9lydgtlB4qbGSzEhdjaWjSH10WzW0JSaiQUKnQtNHDujuHOdKbz+iYLGZ4jCMooW6gfDGBt00LhZuuLHr1lV6PfSSn8UTaXprAMpv3HiS8UrSwjqQIzI4XHuPX1cfP9q5jzY89JxcRHvk3j8Ins5dINXDcTXK15VOI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747284732; c=relaxed/simple;
	bh=2L3Pk7qvML2eYuHYYg2YVqdwoXMB8ML3YiIM7zi09VE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hthXlodfofu9NvaWMuxKmEpD8pZO4AgNPOWhvUW5J6KKemAAAN5tRpQ7z8Htq8NRLqvkD51VLfNlo0+EL3UJ0iBm7H52BrU7C/z9nkokk8rCv5MkgVUenvXI9dGx824MQakRtC2FBswXsVb7i1QFmTQbbad95w1OzMJVXGqGDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y6cgYbhK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y6cgYbhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747284729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZQfA4Y5y5WCYXWaJdtJ9FiM1uyrIyY6MQJ7ycJElk68=;
	b=Y6cgYbhKWCqJppbfd2VdZrJY+TNmbKdtiuwkrz9lQODuZPoN2CKfZChC4RTdC2S6C10/yC
	CcImpwyC8jLn2MmbnYLhsf9UNZRucUfAhSZHKCUmDFPz0OTakvykxAuQeX966ytJ8wJueU
	HtYP4YEJ+Bb+ERIFyvv3WcTbYSNz+Mw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-uo_ZxhkMOdaj_ZiJXsR-Fg-1; Thu,
 15 May 2025 00:52:07 -0400
X-MC-Unique: uo_ZxhkMOdaj_ZiJXsR-Fg-1
X-Mimecast-MFC-AGG-ID: uo_ZxhkMOdaj_ZiJXsR-Fg_1747284726
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0B28180036F
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 04:52:06 +0000 (UTC)
Received: from [172.20.90.206] (unknown [10.30.45.71])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 42FA31955F24;
	Thu, 15 May 2025 04:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, 546bce57)
Date: Thu, 15 May 2025 04:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <46121.125051500520700211@us-mta-328.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0j2VMeW7xTiD88XCAkHOlNLWlMQ6dCdM-rIV_CEvfL4_1747284726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'tpmdd-next-6.15-rc7' of git://git.kernel.org=
/pub/scm/linux/kernel/git/jarkko/linux-tpmdd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1818365620

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1818365620-x86_64-kernel-debug


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

