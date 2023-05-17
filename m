Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D531F1D
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684352406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1u9aMtx2thbTnM5fuxQieWdTz+OFbjPzYLNftD364Uw=;
	b=f1BaSiPviys8Ml83KvkZLPzT9A9PVFhI7ckCO2BRav7J8p3Tfw23WMmZIIOHfWcD6ey6gZ
	xnOlu6nTDlIQiQkCQQzDXWVWyMPRW5/EG7NQtEEY7N2/2FRSRQwmbZmD7/wT4alYF+RzBY
	qXq3qyB2hJvNrfeTu+T068/Z8EBYEaI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-sJNvZW9BPdqrQAZ8Qa62sQ-1; Wed, 17 May 2023 15:40:05 -0400
X-MC-Unique: sJNvZW9BPdqrQAZ8Qa62sQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69E461C05AEA
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 19:40:05 +0000 (UTC)
Received: from [172.64.15.20] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 583982026D16;
	Wed, 17 May 2023 19:40:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc2,
 mainline.kernel.org-clang, 4d6d4c7f)
Date: Wed, 17 May 2023 19:40:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <27637.123051715400501843@us-mta-542.us.mimecast.lan>
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
    Commit message: Merge tag 'linux-kselftest-fixes-6.4-rc3' of git://git.=
kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/89223

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35121=
8


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

