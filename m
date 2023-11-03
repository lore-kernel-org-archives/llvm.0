Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A911101
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 01:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UhvBksmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698976281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yZ3DQ9oqSWyEsRZJfVMDgodKuLbUiTqPEasbY6GQv9M=;
	b=UhvBksmHw6hIl9Ekcb9elXp6VuEWyh1SfJmPjJUxeQqrNJSg5IFq1LzzgdeKoFj99oeVIc
	CdFYA8UrKufxMPqwfQvNfrWPgowQPDRuvMPS+CjReRXXwEBnRwtuUUu+NQ6PUGPWh1233s
	HZUyLHFofzxc+fUuGwmwez7v83YckmI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-8pUVJ31FMV-FS6qRr51blg-1; Thu, 02 Nov 2023 21:51:01 -0400
X-MC-Unique: 8pUVJ31FMV-FS6qRr51blg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C81F101A53B
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 01:51:01 +0000 (UTC)
Received: from [172.64.13.10] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AB5C1C060BA;
	Fri,  3 Nov 2023 01:51:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.6.0,
 mainline.kernel.org-clang, 431f1051)
Date: Fri, 03 Nov 2023 01:51:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Message-Id: <94530.123110221510101987@us-mta-609.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'leds-next-6.7' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/lee/leds

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/112854

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/42264=
7
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/42264=
8
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/42265=
0
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/422651


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

