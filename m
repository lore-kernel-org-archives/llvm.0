Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14262222BE
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 07:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294931; cv=none; b=KLMZP4u9nLUKLSGo8gkf4II7R4JsIysd980m7ghnHmYoDLiIVk60rl++F7dwWC6Lhcb5JyCR8Q3vuKD5LyPsYuN4YTSTA/Mt7n/d6yABaN/rkxFcCZxCvOk+iZ1A7SxPjyll/jhKfEgZqiDqPWpS6rAb+1x4qwTB7xYCY6SxDug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294931; c=relaxed/simple;
	bh=cyJSY0r8n95hKVZy6sgV4WtLF4+sUjG8oEYshwX4frc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ed8WTrzfJKY+NqKSVkcz7HP1L3BoqAOUsrkwjl1B/Kia4A2WdqcCcLNaBQAYz9Ytb3SIUSTqw7qFliQwL9SbXFKsx+KciftQjEBIi8PUUxSrc2cB/rO/ai3yXlvbiHZlh0nn2b8FfxRIfDzuuGtNKuCcohY/LfhYx6Hy4Le1suo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ESz4HKWH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ESz4HKWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747294928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mDtuYT2TabgAhi0Aa/55vkwz/rttRxfvY7AIW64crlc=;
	b=ESz4HKWHqniRB0Bzmm/L6iQeEvVgmByQ12H+f0lHy0zhGbSp3/gNmTHhkd4EGrfrCYLbge
	/YuTxSTRufr7vE8bjb6Rb8yMXuVm156sRzTvZvAQwu8AnZMxMu3C+Y7PQfuPOS98Z7M/p+
	L8Gvw+WRa4sEeCDpmWdejFLRvdXQGwc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-BunpHYSmMlWeV0RJyulz6w-1; Thu,
 15 May 2025 03:42:07 -0400
X-MC-Unique: BunpHYSmMlWeV0RJyulz6w-1
X-Mimecast-MFC-AGG-ID: BunpHYSmMlWeV0RJyulz6w_1747294926
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57C491800361
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 07:42:06 +0000 (UTC)
Received: from [172.20.90.206] (unknown [10.30.45.71])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0552E30075D5;
	Thu, 15 May 2025 07:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, 088d1324)
Date: Thu, 15 May 2025 07:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <56692.125051503420700662@us-mta-517.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ir4DF3DcWfsE9fM9nzk5wDyRT2qJmrpzCS_UGcgvlxw_1747294926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'kbuild-fixes-v6.15' of git://git.kernel.org/=
pub/scm/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1818625811

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1818625811-x86_64-kernel-debug


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

