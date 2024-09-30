Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDD52AE8E
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703204; cv=none; b=kTARdzGqUP4R8j74y97kjdWUnFxnwi3FhzbHCdQcGpASl0UilP8SXGAu56IQ7MXBxAAQMvvxtBRbOKJ6XTlUEVSxecLeptUj/zXNRQiuxgdkV2SDvH8ewyPK50lK1P/RrvHCijGlKrrTWjAHWZDDRqD5bnGgci1tIjKjdetFHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703204; c=relaxed/simple;
	bh=DPc+mjmZSfRnosK38k9eyLg3rLnvx+WDq9f24k9uHvE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=arVVixT/l1rIhBKY8muzHAIk2Q3KvsOFJduqbNIXT//+k1X1wgvCsOkjXkvJEtRW9HbLW+9rysmF1C9bKwUaIcB1bwJqxdFBMI5SsAvSYGNSeiEKJ9JI6GAT5q8+YgwB/0Ls04R2tAoCIVUj3tI3+emUEqMOChljW4yiPzCMyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BN7qZW77; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BN7qZW77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727703201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4gF16ppbCm5TwmHPTbfW5lV9gZU9M/2RN2Uwf7HcvtQ=;
	b=BN7qZW77Z/4XHDJUaCLMNTgiKo7RBcSPQAcK+Zxg9e0LGzqAsOWr/fDgbTCCsUKFTSG6qh
	mJkPHr0iZYZb9DdQYL16BJM1NuX/f34YLAZ6ufZfKKMpm+b03ZmqAuKhW6T9LpGZew4P5i
	aQqR6f6ULcZgVkUr4wUONvFFm012awA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-qjRrmH_4OZmMwb370suKwQ-1; Mon,
 30 Sep 2024 09:33:20 -0400
X-MC-Unique: qjRrmH_4OZmMwb370suKwQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD7BB190DE12
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:19 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.33.101])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8BF491956088;
	Mon, 30 Sep 2024 13:33:19 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 36304006)
Date: Mon, 30 Sep 2024 13:33:19 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <10306.124093009332001457@us-mta-637.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'loongarch-6.12' of git://git.kernel.org/pub/=
scm/linux/kernel/git/chenhuacai/linux-loongson

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1472846570

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1472846570-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1472846570-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1472846570-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1472846570-x86_64-kernel-debug


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

