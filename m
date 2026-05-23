Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393763090C1
	for <llvm@lists.linux.dev>; Sat, 23 May 2026 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779559931; cv=none; b=KOXrLnxr86VVPxn7wCLD3nV/8LbZjUKWX7i1tf/4RxaQysZvdhH6fQ6fmhUVDB8zWKi9bsh6IVhgKL2Ob4GYSt1J7EoHDH7bJlJ6QqLhzuao4HgH0NYp7OtiIshRF6GDmA65NjRqhX/QOgWdow9Hq6bAKDP+AwIRYOv5MabsrZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779559931; c=relaxed/simple;
	bh=f+MqtdydUgDYYM94SsjMOxBNDPqIQ16X3oxHNHxBhyg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=k6gD5rbvXzzcYL9Rc/hfj9kYmQjT79QJPNbPduStzBfd5SH/CfQEH5WE4ScfIyraecHJEeSVIplHYdPl8dh++smEhn33H/vCN+OGAMbuTT3GjZmuOJTQnlrSxR03DRogURDB1WokPtA0QHJ8TdKw5taIWgGdKhpz23z5QJrl5j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZtWchOiw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZtWchOiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779559928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xlRURdmWDHhCVc8NW6FPb+qTsKb9W+LimYAg3xTlDGc=;
	b=ZtWchOiw5clRnKK7pbO5GyHebY+scgNOl6HOdDlZIHZdMLOou5aVjXzLIh8HO2da+kJFxa
	1is19R0VA1oT0mgrFYCP4P1crBL0FvZfR25T4Yo6D/s64O9fgM/Vp4Gc+blxiNPUOiErOY
	ooPX1euYaOH0Gl7CYTXm4wvvRyJ5lHQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-8ZF1ZEadOiGkdGCCMYBr4g-1; Sat,
 23 May 2026 14:12:06 -0400
X-MC-Unique: 8ZF1ZEadOiGkdGCCMYBr4g-1
X-Mimecast-MFC-AGG-ID: 8ZF1ZEadOiGkdGCCMYBr4g_1779559925
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA7991956080
	for <llvm@lists.linux.dev>; Sat, 23 May 2026 18:12:05 +0000 (UTC)
Received: from [172.20.212.222] (unknown [10.30.45.124])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 537E11956053;
	Sat, 23 May 2026 18:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc4,
 upstream-mainline, eed108ed)
Date: Sat, 23 May 2026 18:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <30243.126052314120600333@us-mta-275.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gQK8dp83_3rNziZ9DrMjCHT00diLeOPTToamKCkleLQ_1779559925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nios2_updates_for_v7.2' of git://git.kernel.=
org/pub/scm/linux/kernel/git/dinguyen/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2548293912

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2548293912_aarch64_kernel


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

