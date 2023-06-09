Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A696408D4
	for <llvm@lists.linux.dev>; Fri,  9 Jun 2023 20:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686343865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4xKA59oH0YKkzrFh1zQ1Y9PipR2WLmVR1AW06oKQHgs=;
	b=PKdCP1UmGvbk5tIC+mg2i7VRK1a+6xjW3EOmDUxrIKKYe3biFJoNn+fIEm3pykGsJmSIWv
	8JjBA03HWyjwSeFHJKERXcQDNE/J5EWxBLfTIOT1W7+DB0XpLdXsSJ2JGihCjdOp1QE0qY
	bHse4AuvThQ9JKgaTTj1+WnTSB0uS4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-Hgfh-W6MMriX4fuhO9uy2A-1; Fri, 09 Jun 2023 16:51:03 -0400
X-MC-Unique: Hgfh-W6MMriX4fuhO9uy2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 839A08007D9
	for <llvm@lists.linux.dev>; Fri,  9 Jun 2023 20:51:03 +0000 (UTC)
Received: from [172.64.0.113] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CE93492B00;
	Fri,  9 Jun 2023 20:51:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (SKIPPED 252 of 346): Test report for master
 (6.4.0-rc5, mainline.kernel.org-clang, 0f506c7f)
Date: Fri, 09 Jun 2023 20:51:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <10100.123060916510301599@us-mta-265.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'riscv-for-linus-6.4-rc6' of git://git.kernel=
.org/pub/scm/linux/kernel/git/riscv/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/92032


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

