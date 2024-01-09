Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D024680
	for <llvm@lists.linux.dev>; Tue,  9 Jan 2024 02:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b3wkBV8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704766864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m0NfMJ6g/QLH7q/MkNc55acLBDW3xN4hVJdvGelRNuE=;
	b=b3wkBV8KbD9L9SOgZ1FVNRyYNg6HTk555zJSw9li0tTxqJun+p4LL1QqXWNZRydWmwfjK1
	WrF+wB4oIQtx4Wv81RqVL1FDOgB0JjeSVpmIeYjG2xwl4y9VSNpZdFCnwkeV2auf5BIAOH
	9mabcSnPeWLgc/b6q1YLSw7CiZG1I7w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-e00IRRFaNEu3tlzhsw21hw-1; Mon, 08 Jan 2024 21:21:03 -0500
X-MC-Unique: e00IRRFaNEu3tlzhsw21hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D468585A58B
	for <llvm@lists.linux.dev>; Tue,  9 Jan 2024 02:21:02 +0000 (UTC)
Received: from [172.64.3.46] (unknown [10.30.33.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDC1CC159B0;
	Tue,  9 Jan 2024 02:21:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.7.0,
 mainline.kernel.org-clang, ab5f3fcb)
Date: Tue, 09 Jan 2024 02:21:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <04584.124010821210300137@us-mta-530.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: MISSED


Kernel information:
    Commit message: Merge tag 'arm64-upstream' of git://git.kernel.org/pub/=
scm/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/121665

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/44779=
1


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

