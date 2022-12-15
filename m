Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372926AA6
	for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671140406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eKNNUT77ySr5eAs9M1v3SFlI91cx0BnM5QWiT60/weM=;
	b=X9VlZc89sY+2C3DmmqB3YsK5QRumNfhNTSDevbBGHxK5aKJGhTnPLaNQNen/IqIF2uXFCW
	KQsYfsCfVEDaCQelefFAGSDT2KTkP1gKJPQ9ZSNKFZ1wxGoKiITU0FqeEK1VaZFAgM4dQp
	dHECilOsjJbz9WcL/FfDjGoL7FfjvA4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-539YU388MaeiDRREz3X9Wg-1; Thu, 15 Dec 2022 16:40:04 -0500
X-MC-Unique: 539YU388MaeiDRREz3X9Wg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C0CB858F0E
	for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 21:40:04 +0000 (UTC)
Received: from [172.64.12.49] (unknown [10.30.33.198])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8969C492C14;
	Thu, 15 Dec 2022 21:40:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master
 (mainline.kernel.org-clang)
Date: Thu, 15 Dec 2022 21:40:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <86916.122121516400403913@us-mta-204.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: FAILED


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/63500



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

