Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E69456
	for <llvm@lists.linux.dev>; Tue,  2 May 2023 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683071468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OUt/bRvxJcQCqA3r9sX/MPimx9wPufSoNdnimovKsZg=;
	b=UxSyY8M0zlO5YYbJ0F6Cj4b/jsHC3I3HjjMkzc9rU7zz2qSh7dpG+cbVFYng1W2FDYZIMz
	oU1S0BBTHFMM880iTynQo/uYbL8CbO0Qq8SPqGABSBTjhEPW8UWYY8e75Dccfg0ABt5tTi
	kivHzBhMPykWDgT2cCCPlCM9iiVqO8c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-d6yFaNBZP9yNdkfk_Gm7oA-1; Tue, 02 May 2023 19:51:07 -0400
X-MC-Unique: d6yFaNBZP9yNdkfk_Gm7oA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A2CAA0F381
	for <llvm@lists.linux.dev>; Tue,  2 May 2023 23:51:07 +0000 (UTC)
Received: from [172.64.14.17] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81DE663F5F;
	Tue,  2 May 2023 23:51:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, 348551dd)
Date: Tue, 02 May 2023 23:51:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <24858.123050219510700577@us-mta-41.us.mimecast.lan>
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
    Commit message: Merge tag 'pinctrl-v6.4-1' of git://git.kernel.org/pub/=
scm/linux/kernel/git/linusw/linux-pinctrl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86906

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34283=
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

