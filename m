Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D841B0439
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 23:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756940590; cv=none; b=m1zEWugRuXRRCtUgN1O2TuCXdYO1BZHupUvAzarkb0SCzwW4tjp7qwvRhjjrgRY0a0GHbWLCeB7J9ywfR9BHYNk/3OMOGA9rVOTCnWMevcnpScSWQE9/qObNmVP/02TZaf0fVPnzqs7Nze+3U9VCa1uBDRCrJSCJJX1s+GTw7XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756940590; c=relaxed/simple;
	bh=IpoZs6zKtBHU3B2+7f2kf8SiIpcWb4qBYuTAkxl5ZI0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jyn1OeXDJEVoO1D6NUVFra5OiRqwT5ABuFQEjKw/STdSAGiEuAt3zHdWr4btBOKXfe6fa5qQsRBgbJdpri5o5SH4P2SDeZhbnCzPWhH0SeLIM5HMeY6+Jh32jFdWXJTZS1+BeKqBMCeJelFbbQrd+xNv1vE68Ub88JeTIpJL/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSS29NZd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSS29NZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756940587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=er5VAy80K9ZPs3coW/eaSzefI2ubxY9xvh5xOvlKGC8=;
	b=iSS29NZdRtK6X55azzU/KR82kgZYxO6PruX3JMIsTPvzf/h/Mx/rRbfpxavYcJgkfh2j41
	jhu5/RgeejvuG8CfpCj/ldltKHruMlOaWvnoKNbCwNGtwzaVY4d2t2MeLJVIdp5cSmc6pw
	4Rzd5CEb6nCm21QTUVPcuOQROpLSZ60=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-216-IWoxe7iQOV2PzlmDoLc5Qg-1; Wed,
 03 Sep 2025 19:03:06 -0400
X-MC-Unique: IWoxe7iQOV2PzlmDoLc5Qg-1
X-Mimecast-MFC-AGG-ID: IWoxe7iQOV2PzlmDoLc5Qg_1756940585
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56CDB1800286
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 23:03:05 +0000 (UTC)
Received: from [172.20.143.215] (unknown [10.30.44.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C0E8D18004D8;
	Wed,  3 Sep 2025 23:03:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.17.0-rc4,
 upstream-mainline, b9a10f87)
Date: Wed, 03 Sep 2025 23:03:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <35880.125090319030600295@us-mta-216.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i71bZorBRfzLvfcq5_a1MCVyHr2NDaeatWdWUotonYs_1756940585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'soc-fixes-6.17-2' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2020592233

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2020592233_aarch64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2020592233_x86_64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2020592233_x86_64_kernel-debug
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897


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

