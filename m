Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791524C99
	for <llvm@lists.linux.dev>; Fri,  5 May 2023 22:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683325205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3CJ1hf/Oz6/fPkhotoS/Y87vWvNqBNTrxFlplTlGJh0=;
	b=fkuw8+V1gtG5ORVof6m1QbzfVzVXbx9to2UUAUb31+lgBcexn9Hg3Vamr1RVF9Bhqf3o1s
	0OcRTSbl30SfyXy7sf8oaLbFSFPpumNjKRGLTfNkccR1tlrgdp+x/cbhT1oje8dYI4J6zx
	wqmRPE0i+VlLeCnaZwCn1YsjxF+55cU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-K9w2a-gEMjOPpCab57F6jA-1; Fri, 05 May 2023 18:20:04 -0400
X-MC-Unique: K9w2a-gEMjOPpCab57F6jA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E173886460
	for <llvm@lists.linux.dev>; Fri,  5 May 2023 22:20:04 +0000 (UTC)
Received: from [172.64.0.115] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07D7E492C13;
	Fri,  5 May 2023 22:20:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, 418d5c98)
Date: Fri, 05 May 2023 22:20:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <01014.123050518200400471@us-mta-297.us.mimecast.lan>
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
    Commit message: Merge tag 'devicetree-fixes-for-6.4-1' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/robh/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/87446

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34454=
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

