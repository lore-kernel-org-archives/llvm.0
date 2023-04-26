Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B19B79D1
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682548208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hIr/o1Bhazfyyj2V/emmiU6Sq8oh+VGCGu0ZcwKr1r0=;
	b=c8mnN+4i35v1G+tI8niYaQe1zUs6s2K+uXk3jYT4CkpzhmTov7EATSrn0RKUwRhj7o1xa0
	ct0cmbP3C8jscnRHSRrp5qkkei+1SZCPcmL2wUeRQ+a4jvuxvtImYdb/pU01QIX0uTYOZ3
	czJzx19x/+wJb+xSVmXgF7RGv7hkJFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-Fa4KLU5UPRSLp7PjjSDJMA-1; Wed, 26 Apr 2023 18:30:05 -0400
X-MC-Unique: Fa4KLU5UPRSLp7PjjSDJMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6233AA0F388
	for <llvm@lists.linux.dev>; Wed, 26 Apr 2023 22:30:05 +0000 (UTC)
Received: from [172.64.15.55] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E4F242AB8;
	Wed, 26 Apr 2023 22:30:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, 36006b1d)
Date: Wed, 26 Apr 2023 22:30:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <20336.123042618300500679@us-mta-533.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'ata-6.4-rc1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/dlemoal/libata

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86179

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34031=
9


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

