Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA33239
	for <llvm@lists.linux.dev>; Sun,  7 May 2023 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683490809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pS2f9HFZ9Uo04IjkIhZOnW9tMjy/NEJLymc1cnKcFZI=;
	b=Wv1d9LwuEFVZ3zNhl/hzZ6BVtCVhYXM7Qn+619rDyFyCQjCQXcJpF6n33QwAJH21P0OrmT
	uIkeR2+dbBYxtfk0m3iltoq8xKvZXQg9tZgYPnChCR9abHBxoAD66oGVYp0g6rYHiHV0O7
	GT3sM6OxgWeHRHFV1OXfJQV3F8oMrOs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-NVgeUckROmCHZPwz5DKpbw-1; Sun, 07 May 2023 16:20:05 -0400
X-MC-Unique: NVgeUckROmCHZPwz5DKpbw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF56529AB3E3
	for <llvm@lists.linux.dev>; Sun,  7 May 2023 20:20:05 +0000 (UTC)
Received: from [172.64.0.115] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AF38492B00;
	Sun,  7 May 2023 20:20:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, f085df1b)
Date: Sun, 07 May 2023 20:20:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <88411.123050716200600218@us-mta-498.us.mimecast.lan>
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
    Commit message: Merge tag 'perf-tools-for-v6.4-3-2023-05-06' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/acme/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/87534

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34487=
7


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

