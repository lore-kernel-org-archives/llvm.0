Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326892D057
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722961331; cv=none; b=fClg5sEj6jFVDtVXIHyo0HvHWkWV6O84ZJaYxuYUauNjKGwrdsLoUbjbZjl/7L1e+G1RU/2b+UNxxLXZ6VExkPIwrrLA3DSMkHa0YPN2KyfYbR9h3pU6SbQsXxgY0U3e06ZEolQUZqGuSTj+PjSaLW5D3CPBYAdIS6Kz+cjjmWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722961331; c=relaxed/simple;
	bh=fkmmvyuJLeg9IHjzePPGhfZ0aciZoHmk6Uu1tqb3bdM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Zkau0ZscrZp7atFCLWLdnPvXPGuHS8PtenfDdzYpSg9LxKyoRXb5cp20YFCHjHR+YzUUbP+F5fwjtxrCnugon9bu+AAGGbHozmJ/+ba+narWkvkUBWBdGWVsnOrBouf002QlwyYEmRMvGvSNERpuekXEHU4JT6owFPgQj6qf6PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ih61KjLK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ih61KjLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722961328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1BQ7LOfvVpzWl8XbZJdYBQ5P7U1x/8XhsH7XS5pNwQk=;
	b=Ih61KjLKM+QHGIw23miCkZdcYfRIvWSADKPOGbMmT/InM+SZ9e7LYOI9AVaAPxKcrYXdd1
	vukwF9bDJE0RuM2LqtwQWrozw0d0gD4lovTk8oI70iWjp7Ep18przi3YOSR3ye9Cb2oJ9X
	Wt2lMIOW6E1Wbjye2w1QAmrl6xt+mvE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-377-l34JhBViP2qrfK67lLCS8A-1; Tue,
 06 Aug 2024 12:22:07 -0400
X-MC-Unique: l34JhBViP2qrfK67lLCS8A-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94873195421B
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 16:22:06 +0000 (UTC)
Received: from [172.64.15.28] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A78701955D45;
	Tue,  6 Aug 2024 16:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc2,
 mainline.kernel.org-clang, eb5e56d1)
Date: Tue, 06 Aug 2024 16:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <19411.124080612220700511@us-mta-377.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'platform-drivers-x86-v6.11-2' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1402904477

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1402904477-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1402904477-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1402904477-x86_64-kernel-debug


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

