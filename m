Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869F180
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 00:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687305965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZJ4B7i9247B7f6V5KU85wxWaVDGiieboDkr2FModoM4=;
	b=NQ/JTlviMFU4GUX4REKVEJgXME1j/mfXQFRE3iMfXxaaiBMfyQLSE9Hwuo/wv2daguHo+T
	C1MV1RNBoPNRw93Tng5ETBFQue9impTe1gKz85QXhX0YbLabOfAuywhCVkacJu7oL4X6Ta
	EF/HG2bpCZjPfAAYtUZjejAJ/u8rP2w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-XR1hkHHBOai6BWtWRwlxTw-1; Tue, 20 Jun 2023 20:06:04 -0400
X-MC-Unique: XR1hkHHBOai6BWtWRwlxTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B579B85A5B5
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 00:01:02 +0000 (UTC)
Received: from [172.64.4.14] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A8702166B26;
	Wed, 21 Jun 2023 00:01:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc7,
 mainline.kernel.org-clang, e660abd5)
Date: Wed, 21 Jun 2023 00:01:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Message-Id: <65332.123062020060400402@us-mta-634.us.mimecast.lan>
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
    Commit message: Merge tag 'acpi-6.4-rc8' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/93168

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36406=
2


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

