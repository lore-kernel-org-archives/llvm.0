Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B581C06
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 02:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688091666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EDsteCYtV/jwDjphiVljPazb5YmLbCmHlpsbpIm0XhI=;
	b=CBUWaBNUhj6dp07An93SdncdSsFjc6gHfMXafrVcZEO2LLRqVmxjEDlqZxTHMMh1jI2Gsd
	ENNCTx8pMI37Y3ZTW6wymvjJYLVyqdJ1r+JU/xhWuKcElfcsu2hPcY5ngtHyemrfHBmq5S
	Kf6CMxI9mArhLTr8+vpz6/69+2ikKCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-uE2cEBL7OqWia3hl62Sz9g-1; Thu, 29 Jun 2023 22:21:02 -0400
X-MC-Unique: uE2cEBL7OqWia3hl62Sz9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E8D7830DB5
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 02:21:02 +0000 (UTC)
Received: from [172.64.10.50] (unknown [10.30.33.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 516444024949;
	Fri, 30 Jun 2023 02:21:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, 82a2a510)
Date: Fri, 30 Jun 2023 02:21:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <12794.123062922210200163@us-mta-363.us.mimecast.lan>
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
    Commit message: Merge tag 'sysctl-6.5-rc1-fixes' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/mcgrof/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/94302

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36786=
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

