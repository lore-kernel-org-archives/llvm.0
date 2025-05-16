Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED7A25D54A
	for <llvm@lists.linux.dev>; Fri, 16 May 2025 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747419131; cv=none; b=YlZsM1+lFzMfwquZvdzwRVWQGV+5L3g8cNbJvcsqPDk9/lLMzIGU8/UlZMmHzxWrB65bL5UbZ0R8fexqgpXRS4indlCYYccISg3/StUf4AXaptb6lh6HuZSHavsdLstKSIexv7FszG1BdDdmBHtcZFFtX832ycyr3AtVi2xpGFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747419131; c=relaxed/simple;
	bh=7DDcYMJbo5107TIEhXGeRNYb6rwSBCeTy6398j6nQw8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=k7uiNtMRss1T0yVXX2DmD7HUVN3i/LdBNthg8+YTpQl2eMERca7Ob7AFggXOjNAdlGnpwQae6mJ+8e9599PWntchCZOe3ki/fCtPmTv5CLdsTp3gtq4O/VfN4XLBTyf4tm7E152U2Wz699SSglWH0lorf0PqW0b0rTrTg6LTuZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2vLY7Bm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2vLY7Bm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747419128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T4XstYXvdPhzHplFNlIElK67XNVu7iVWYM7zUcXqF6M=;
	b=U2vLY7BmtY6cNDwyTQgih6WsIrv11DILcy5vf2X0xpVjuQ83NK/NsJkglBRvO3XrnZ2TjP
	f/R2bciZHhRao9D1uNj7D5gbBikr89b22OZLvoE4IW1g2L3yUb9/YgMDc1V0IRyqxjcQNO
	vN5ItUaCAp29z87FDGUPxeSjw+0Q8uM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-127-aGiD00iNOb-sDlv09aUVEA-1; Fri,
 16 May 2025 14:12:07 -0400
X-MC-Unique: aGiD00iNOb-sDlv09aUVEA-1
X-Mimecast-MFC-AGG-ID: aGiD00iNOb-sDlv09aUVEA_1747419126
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5BD6118004A7
	for <llvm@lists.linux.dev>; Fri, 16 May 2025 18:12:06 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E40F3195608D;
	Fri, 16 May 2025 18:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, 3c21441e)
Date: Fri, 16 May 2025 18:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <84539.125051614120700245@us-mta-127.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3sVDp-EEyjGZjZAoDAsvHvsnXKP_JurtXDyworS2ano_1747419126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'acpi-6.15-rc7' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1821711767

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1821711767-x86_64-kernel-debug


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

