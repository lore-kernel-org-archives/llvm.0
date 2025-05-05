Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA81684A4
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746474131; cv=none; b=i9lX1MrWdLJedHJ+Q81ctponVB5WRcDEFrrcZGyHR1du1iBBlt/EXVwn75mi6yJm6giUZb1wgVgZhEEsKQ+XkfJM51jsH+Kz/NyYhW6XFo91gpukORov0jPKXBMFDarXRJnMsZxR9wHJEu+vhDLxPcjpBVuqzxdXqZ1auv3M5ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746474131; c=relaxed/simple;
	bh=6gkj8K3vayHzkyrkSUjHRkGx+PQxmlXGAx7WAo7+ZbA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Rh8NPDiQg6dfC4KoKruY5Uh6I7oQGoWeh8V1G14LSWS3cad0gaRk3QJdc1qq1RJDIy5lCPm7XitYuW30JNqszSn08+XeL19jLBaTp6xhnr9gd0TY5T6rz92mPlmiv1EZqLH0GoZBTqkpv4QtqELU0stipXa271iuu5i5AcEOWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AhMyhYlN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AhMyhYlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746474128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2I+GzfpB6geTBX2zWqqRFyOgwZCHfnktNXlwZSrhp8=;
	b=AhMyhYlN2xV4hXmwQ2cQHOGRNTx8ntSksOnwWBxFGkgHgG+mTsIvg2TEohYksCpmfFy2AO
	wTorrHbrkrSMxni3j5dSRxlBazKZhyTduoArLcMd1eBJB4IBzTQ7YjBryiCvJTbXnq4yl2
	YHqWF3Exi/EaNIMOJYuvakfWY2YA8X8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-tbOC2QB5N5aZ0B-3LqKJOQ-1; Mon,
 05 May 2025 15:42:07 -0400
X-MC-Unique: tbOC2QB5N5aZ0B-3LqKJOQ-1
X-Mimecast-MFC-AGG-ID: tbOC2QB5N5aZ0B-3LqKJOQ_1746474126
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48B3E180036E
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 19:42:06 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D7C9719560A3;
	Mon,  5 May 2025 19:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc5,
 upstream-mainline, 01f95500)
Date: Mon, 05 May 2025 19:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <27169.125050515420700799@us-mta-677.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pakFhhHahEwaXUPqOsyLHvmEKwqdwSuSPrwgRz50U0A_1746474126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'uml-for-linux-6.15-rc6' of git://git.kernel.=
org/pub/scm/linux/kernel/git/uml/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1801307747

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1801307747-x86_64-kernel-debug


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

