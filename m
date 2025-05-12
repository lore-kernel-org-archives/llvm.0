Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E1D14F117
	for <llvm@lists.linux.dev>; Mon, 12 May 2025 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076590; cv=none; b=Ak0ZIEwXJl19+z8elarToPD9zAcD2w4EWAn6KYUUWKR6n6HApE7dJCeUQEfuyL+SwMZnmPfDCPxa/qqJ5kuCKyTmcyZYK+tVFZE4FHjDoC/md5YbROvxEnItOYI+l5jZXf0u4/fbmYt/7tZ7CegBfq61wQoRq6MbW8JUQIJ4GGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076590; c=relaxed/simple;
	bh=O3xnDzkOnnFLPvM6ysr9dJBetqk/nIbcUWqJLiIcIsA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mlzM+kYvohv9uUMCYNi2hqsb239RLjLjw1u50dPdxLeSlEWS85B7B0qiBlOJqNyjhIa1xWk2sdk8IiHxZZ8Xo5TzbhxVjL1qYqegRPWnVwylcyzRHTBmCIdG+s1zRfbhiMC4lYg9UnckH0LQcjd7CM27CrgCvRgsO66EaH/km24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aQ/RuscH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aQ/RuscH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747076587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oX7xS8kchwdr34Mh4c2lnwTE88flc6OUyctx/Z95Cww=;
	b=aQ/RuscH88S/QCeLvXhkpLfZqpiR4G7o1jDt1TWcM+odAjKTCS6ttbuIpkv945LCIAHOmA
	PDQ/UdrYstZNT/MzFBZ7aGz6wJBGvPVzq2/eziN57IzzaPSbWYEhFqsI0htSTNF3rETNo5
	3APntw6IkFalrqVNYJqYjvo6bBOZnY0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-OTSaR3D0MT6mkySoCB60iQ-1; Mon,
 12 May 2025 15:03:05 -0400
X-MC-Unique: OTSaR3D0MT6mkySoCB60iQ-1
X-Mimecast-MFC-AGG-ID: OTSaR3D0MT6mkySoCB60iQ_1747076584
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30F48180010A
	for <llvm@lists.linux.dev>; Mon, 12 May 2025 19:03:04 +0000 (UTC)
Received: from [172.20.141.161] (unknown [10.30.44.25])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C71221800359;
	Mon, 12 May 2025 19:03:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, 627277ba)
Date: Mon, 12 May 2025 19:03:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <16816.125051215030502401@us-mta-237.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5X_WN1726om9QDMhSm3Nl6vMOXvrDqIgrUtHBCdwd3I_1747076584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'arm64_cbpf_mitigation_2025_05_08' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1813519952

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1813519952-x86_64-kernel-debug


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

