Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C118F10E1
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 05:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691645466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zgv2ig6BGwADIKKt0nRZYdYZoQawZL2iV36ALhqBfc8=;
	b=jBvrqpaI7VIjW3VAy0nGPx2eSGr/QU1v2ZSC97poqdfzoY/YcOiUjIWNqD9WKYCjsn+ieV
	7IpaEoSJDr68MDbfFFXt1Tc7+XI6Rt+a2nUfaXCEymaTBfQYlV0JyeMggfFrR7F0Lqxg60
	n9FftObfshMkkT0SrO98ynIoIaIA4iw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-LyaEQIgMNRKRubao0ctHlA-1; Thu, 10 Aug 2023 01:31:04 -0400
X-MC-Unique: LyaEQIgMNRKRubao0ctHlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8944E8DC665
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 05:31:04 +0000 (UTC)
Received: from [172.64.4.35] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78830C15BAE;
	Thu, 10 Aug 2023 05:31:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.5.0-rc5,
 mainline.kernel.org-clang, 374a7f47)
Date: Thu, 10 Aug 2023 05:31:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <09569.123081001310400609@us-mta-651.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.5-rc5-ksmbd-server' of git://git.samba.org=
/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/99463

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/38378=
3
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/383784


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

