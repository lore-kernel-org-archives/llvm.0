Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B532110
	for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 05:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349588; cv=none; b=hkg0qpV09SFmrm6dJXv1HwGmqrH8jttaZCdE0KVqcxH0lZ1j2cPjFO6BK8tKwAv6yEcLCDjq+uDmmlTrubzIDOVIF82YL+PeR00QX+4JJh0m8xzzJB1+pVyAFgvqyNHI4OcL0ZHkKT7MpJIUxYD++rrPmXHvwBh7b8wDSzeXt+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349588; c=relaxed/simple;
	bh=grBWv+7tdHcHqleQf3nqw56DG92WbWrT6uZLPpnYFuw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CFB/28mwzEADp9WrgwCSMIJLv1Tx0ED2IDsE/2mr2dhGv32EnuzxUbLhJASW2nSogdElDgjM/ydnu3DP2mTMiofZxVu9Ke+5NSoWTLPaJ289d0iSgaOGu748MXpzlPsF46lPa//Dw9UdVJnMbPOe4Etqz8sg3FkjJ0GrcVbHPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HLuOxtsw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HLuOxtsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744349585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gEE3kGooi5kXsumrcGffaEckjDQ34mjXC3dwDDZb+ro=;
	b=HLuOxtswJfY0rB2p/lEWYkIBl/yPux5DvlBn8wMxsFiVrCCR5kHwIbm9B47UGWtNtyYVVX
	k7tMScrhAE1cWZRAJ7gbrLzyYmtF07LKNa+qUI39pET0ey/jTGA+zCHyvQQYVstNAhch19
	baqKF3tO1MXoBxB8hnNEE3xZ6Oq56cE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-dWzP0tq_NSS5yjLsHXoZVg-1; Fri,
 11 Apr 2025 01:33:04 -0400
X-MC-Unique: dWzP0tq_NSS5yjLsHXoZVg-1
X-Mimecast-MFC-AGG-ID: dWzP0tq_NSS5yjLsHXoZVg_1744349583
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 364611955BC6
	for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 05:33:03 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF6571956094;
	Fri, 11 Apr 2025 05:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc1,
 upstream-mainline, 900241a5)
Date: Fri, 11 Apr 2025 05:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <43776.125041101330400493@us-mta-605.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XiXanWOhobRnZtdOGD8PlV3YrN1MfcAsZl_o9UwxkEI_1744349583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2025-04-11-1' of https://gitlab.fr=
eedesktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1763554588

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1763554588-x86_64-kernel-debug


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

