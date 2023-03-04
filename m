Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD5F7E
	for <llvm@lists.linux.dev>; Sat,  4 Mar 2023 00:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677889208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=avvlXCFZuIuT39xax3YyVKdjBDJwjMJNueulLXXt6Qk=;
	b=iz1EoBPfBAtFwvuxb8neROJYoWuZEoTiiSBFxVrn3bH6ZB6qDzz8cqu2bPEvoUNz1fokte
	llX7pdXbSopcUPsKdgOTWZyNZXKZpk+nHnO4m9Ra5sn1gsEHvxuWDIR6+dSZsEf3gLhHEe
	MuAmzQYFotpfDYMVl9FKbYCZbdGliw0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-g96HfMRwNcu0GJ0MqGw4qA-1; Fri, 03 Mar 2023 19:20:06 -0500
X-MC-Unique: g96HfMRwNcu0GJ0MqGw4qA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7753E3C02523
	for <llvm@lists.linux.dev>; Sat,  4 Mar 2023 00:20:06 +0000 (UTC)
Received: from [172.64.0.76] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E074140EBF4;
	Sat,  4 Mar 2023 00:20:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, fb35342f)
Date: Sat, 04 Mar 2023 00:20:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <10391.123030319200600131@us-mta-288.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: OK


Kernel information:
    Commit message: Merge tag 'cocci-for-6.3' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/jlawall/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/75952

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31921=
5
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31921=
6
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31921=
7
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/319219
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31921=
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

